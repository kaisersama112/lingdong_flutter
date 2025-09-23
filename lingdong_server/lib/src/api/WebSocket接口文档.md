# WebSocket 接口文档

## 1. 概述

本文档详细介绍了系统中使用的WebSocket接口，包括连接建立、消息发送与接收、状态更新等功能。WebSocket提供了双向通信能力，使客户端和服务器之间可以实时交换数据。

## 2. 连接管理

### 2.1 建立连接

**接口端点**: `/ws/connect`

**连接方式**: WebSocket协议

**认证方式**: 通过JWT令牌认证用户身份

**连接流程**:
1. 客户端发起WebSocket连接请求到 `/ws/connect`
2. 服务端验证用户JWT令牌
3. 验证通过后，服务端接受连接并返回连接成功消息
4. 连接建立后，客户端可以发送和接收消息

**连接参数**: 无特殊URL参数，认证信息包含在请求头中

**返回参数**: 连接成功后，服务端发送连接建立消息

```json
{
  "type": "connection_established",
  "code": 200,
  "msg": "连接成功",
  "data": {
    "user_id": 123,
    "connection_id": "unique-connection-id",
    "server_time": "2023-07-15T10:30:00Z"
  }
}
```

### 2.2 断开连接

**触发条件**:
- 客户端主动关闭连接
- 网络异常导致连接中断
- 服务端检测到异常情况

**服务端处理**:
- 从连接管理器中移除连接信息
- 更新用户在线状态
- 通知其他用户该用户的离线状态

## 3. 消息类型

系统定义了以下主要的WebSocket消息类型，通过`type`字段标识:

| 消息类型 | 描述 |
|---------|------|
| `connection_established` | 连接建立 |
| `message_sent` | 消息发送 |
| `typing` | 输入状态 |
| `message_read` | 消息已读 |
| `reaction_added` | 添加反应 |
| `reaction_removed` | 移除反应 |
| `heartbeat` | 心跳包 |
| `error` | 错误 |
| `group_updated` | 群聊更新 |
| `user_joined_group` | 用户加入群聊 |
| `user_left_group` | 用户离开群聊 |
| `notification` | 系统通知 |
| `online_status` | 在线状态 |

## 4. 通用响应格式

系统使用统一的通用响应格式`WSGenericResponse`进行消息交互，包含以下字段:

```json
{
  "type": "消息类型",
  "code": 状态码,
  "msg": "状态信息",
  "data": 消息数据,
  "message_id": "可选的消息ID"
}
```

- **type**: 消息类型，对应WSMessageType枚举
- **code**: HTTP风格的状态码，200表示成功，4xx表示客户端错误，5xx表示服务端错误
- **msg**: 状态描述信息
- **data**: 具体的业务数据，根据消息类型不同而不同
- **message_id**: 可选的消息唯一标识符

## 5. 接口详细说明

### 5.1 发送消息

**消息类型**: `message_sent`

**请求参数**:
```json
{
  "type": "message_sent",
  "data": {
    "conversation_id": "会话ID",
    "receiver_id": 接收用户ID,
    "content": "消息内容",
    "message_type": "text",
    "media_url": "可选的媒体URL",
    "is_group": false
  }
}
```

- **conversation_id**: 会话ID，字符串类型
- **receiver_id**: 接收消息的用户ID，整数类型
- **content**: 消息内容，字符串类型
- **message_type**: 消息类型，如"text"、"image"等
- **media_url**: 可选，媒体文件URL
- **is_group**: 是否为群消息，布尔类型

**成功响应**:
```json
{
  "type": "message_sent",
  "code": 200,
  "msg": "success",
  "data": {
    "success": true,
    "message": "消息发送成功"
  }
}
```

**错误响应**:
```json
{
  "type": "error",
  "code": 500,
  "msg": "发送消息失败",
  "data": {
    "code": 500,
    "message": "发送消息失败",
    "details": {"error": "错误详情"}
  }
}
```

### 5.2 输入状态通知

**消息类型**: `typing`

**请求参数**:
```json
{
  "type": "typing",
  "data": {
    "session_id": "会话ID",
    "typing": true
  }
}
```

- **session_id**: 会话ID，字符串类型
- **typing**: 是否正在输入，布尔类型

**成功响应**:
```json
{
  "type": "typing",
  "code": 200,
  "msg": "success",
  "data": {
    "success": true
  }
}
```

**推送消息格式**:
当用户输入状态变化时，系统会向会话中的其他用户推送以下格式的消息:

```json
{
  "type": "typing",
  "code": 200,
  "msg": "success",
  "data": {
    "session_id": "会话ID",
    "user_id": 正在输入的用户ID,
    "user_name": "用户名",
    "typing": true,
    "timestamp": "2023-07-15T10:35:00Z"
  }
}
```

### 5.3 消息已读通知

**消息类型**: `message_read`

**请求参数**:
```json
{
  "type": "message_read",
  "data": {
    "message_id": 消息ID,
    "is_group": false
  }
}
```

- **message_id**: 已读消息的ID，整数类型
- **is_group**: 是否为群消息，布尔类型

**成功响应**:
```json
{
  "type": "message_read",
  "code": 200,
  "msg": "success",
  "data": {
    "success": true,
    "message": "消息已标记为已读"
  }
}
```

**错误响应**:
```json
{
  "type": "error",
  "code": 500,
  "msg": "标记消息已读失败",
  "data": {
    "code": 500,
    "message": "标记消息已读失败",
    "details": {"error": "错误详情"}
  }
}
```

**推送消息格式**:
当消息被标记为已读后，系统会向消息发送者推送已读通知:

```json
{
  "type": "message_read",
  "code": 200,
  "msg": "success",
  "data": {
    "message_id": 消息ID,
    "is_group": false,
    "reader_id": 阅读消息的用户ID,
    "read_at": "2023-07-15T10:40:00Z"
  }
}
```

### 5.4 添加消息反应

**消息类型**: `reaction_added`

**请求参数**:
```json
{
  "type": "reaction_added",
  "data": {
    "message_id": 消息ID,
    "reaction": "👍",
    "is_group": false
  }
}
```

- **message_id**: 消息ID，整数类型
- **reaction**: 反应内容，如"👍"、"❤️"等
- **is_group**: 是否为群消息，布尔类型

**成功响应**:
```json
{
  "type": "reaction_added",
  "code": 200,
  "msg": "success",
  "data": {
    "success": true,
    "message": "已添加反应"
  }
}
```

**错误响应**:
```json
{
  "type": "error",
  "code": 500,
  "msg": "添加反应失败",
  "data": {
    "code": 500,
    "message": "添加反应失败",
    "details": {"error": "错误详情"}
  }
}
```

**推送消息格式**:
当消息反应被添加时，系统会向相关用户推送反应更新:

```json
{
  "type": "reaction_added",
  "code": 200,
  "msg": "success",
  "data": {
    "message_id": 消息ID,
    "is_group": false,
    "reaction": "👍",
    "user_id": 添加反应的用户ID,
    "reaction_count": 3,
    "reaction_user_ids": [1, 2, 3],
    "timestamp": "2023-07-15T10:45:00Z"
  }
}
```

### 5.5 移除消息反应

**消息类型**: `reaction_removed`

**请求参数**:
```json
{
  "type": "reaction_removed",
  "data": {
    "message_id": 消息ID,
    "reaction": "👍",
    "is_group": false
  }
}
```

- **message_id**: 消息ID，整数类型
- **reaction**: 要移除的反应内容
- **is_group**: 是否为群消息，布尔类型

**成功响应**:
```json
{
  "type": "reaction_removed",
  "code": 200,
  "msg": "success",
  "data": {
    "success": true,
    "message": "已移除反应"
  }
}
```

**错误响应**:
```json
{
  "type": "error",
  "code": 500,
  "msg": "移除反应失败",
  "data": {
    "code": 500,
    "message": "移除反应失败",
    "details": {"error": "错误详情"}
  }
}
```

**推送消息格式**:
当消息反应被移除时，系统会向相关用户推送反应更新:

```json
{
  "type": "reaction_removed",
  "code": 200,
  "msg": "success",
  "data": {
    "message_id": 消息ID,
    "is_group": false,
    "reaction": "👍",
    "user_id": 移除反应的用户ID,
    "reaction_count": 2,
    "reaction_user_ids": [1, 3],
    "timestamp": "2023-07-15T10:50:00Z"
  }
}
```

### 5.6 心跳包

**消息类型**: `ping`

**请求参数**:
```json
{
  "type": "ping"
}
```

**响应格式**:
```json
{
  "type": "heartbeat",
  "code": 200,
  "msg": "success",
  "data": {}
}
```

## 6. 系统推送消息

以下是系统主动推送给客户端的消息类型和格式:

### 6.1 新消息推送

**消息类型**: `message_sent`

**推送格式**:
```json
{
  "type": "message_sent",
  "code": 200,
  "msg": "success",
  "data": {
    "id": 消息ID,
    "session_id": "会话ID",
    "sender_id": 发送者ID,
    "sender_name": "发送者名称",
    "sender_avatar": "发送者头像URL",
    "content": "消息内容",
    "message_type": "text",
    "media_url": "媒体URL",
    "is_group": false,
    "timestamp": "2023-07-15T11:00:00Z"
  }
}
```

### 6.2 用户在线状态更新

**消息类型**: `online_status`

**推送格式**:
```json
{
  "type": "online_status",
  "code": 200,
  "msg": "success",
  "data": {
    "user_id": 用户ID,
    "online": true,
    "last_active": "2023-07-15T11:05:00Z"
  }
}
```

### 6.3 群聊更新通知

**消息类型**: `group_updated`

**推送格式**:
```json
{
  "type": "group_updated",
  "code": 200,
  "msg": "success",
  "data": {
    "group_id": 群聊ID,
    "update_type": "group_info",
    "data": {
      "group_id": 群聊ID,
      "name": "群聊名称",
      "avatar": "群聊头像URL",
      "announcement": "群公告",
      "member_count": 群成员数量,
      "join_approval_required": true,
      "allow_invitation": true,
      "allow_send_messages": true
    },
    "timestamp": "2023-07-15T11:10:00Z"
  }
}
```

### 6.4 用户加入群聊通知

**消息类型**: `user_joined_group`

**推送格式**:
```json
{
  "type": "user_joined_group",
  "code": 200,
  "msg": "success",
  "data": {
    "group_id": 群聊ID,
    "update_type": "member_joined",
    "data": {
      "group_id": 群聊ID,
      "user_id": 用户ID,
      "username": "用户名",
      "avatar": "用户头像URL",
      "member_count": 群成员数量
    },
    "timestamp": "2023-07-15T11:15:00Z"
  }
}
```

### 6.5 用户离开群聊通知

**消息类型**: `user_left_group`

**推送格式**:
```json
{
  "type": "user_left_group",
  "code": 200,
  "msg": "success",
  "data": {
    "group_id": 群聊ID,
    "update_type": "member_left",
    "data": {
      "group_id": 群聊ID,
      "user_id": 用户ID,
      "username": "用户名",
      "avatar": "用户头像URL",
      "member_count": 群成员数量
    },
    "timestamp": "2023-07-15T11:20:00Z"
  }
}
```

### 6.6 系统通知

**消息类型**: `notification`

**推送格式**:
```json
{
  "type": "notification",
  "code": 200,
  "msg": "success",
  "data": {
    "notification_type": "通知类型",
    "data": {}
  }
}
```

## 7. 错误处理

系统使用统一的错误响应格式，当发生错误时，服务端会返回以下格式的错误消息:

```json
{
  "type": "error",
  "code": 错误状态码,
  "msg": "错误消息",
  "data": {
    "code": 错误状态码,
    "message": "错误消息",
    "details": {"error": "错误详情"}
  }
}
```

常见的错误状态码包括:
- **400**: 客户端请求错误，如无效的JSON格式、缺少必要字段等
- **401**: 未授权，如认证失败
- **500**: 服务器内部错误

## 8. 数据模型

### 8.1 消息数据结构

#### WSGenericResponse
```python
class WSGenericResponse(WSResponseBase):
    type: WSMessageType
    code: int = 200
    msg: str = "success"
    data: Any = None
    message_id: Optional[str] = None
```

#### WSMessageContent
```python
class WSMessageContent(BaseModel):
    id: int  # 消息ID
    session_id: str  # 会话ID
    sender_id: int  # 发送者ID
    sender_name: Optional[str] = None  # 发送者名称
    sender_avatar: Optional[str] = None  # 发送者头像
    content: str  # 消息内容
    message_type: str  # 消息类型
    media_url: Optional[str] = None  # 媒体URL
    is_group: bool = False  # 是否为群消息
    timestamp: datetime  # 消息时间戳
    group_id: Optional[int] = None  # 群聊ID（群消息时）
```

#### WSTypingStatus
```python
class WSTypingStatus(BaseModel):
    session_id: str  # 会话ID
    user_id: int  # 用户ID
    user_name: str  # 用户名
    typing: bool  # 是否正在输入
    timestamp: datetime  # 时间戳
```

#### WSReactionUpdate
```python
class WSReactionUpdate(BaseModel):
    message_id: int  # 消息ID
    is_group: bool  # 是否为群消息
    reaction: str  # 反应内容
    user_id: int  # 用户ID
    reaction_count: int  # 反应数量
    reaction_user_ids: List[int]  # 反应用户ID列表
    timestamp: datetime  # 时间戳
```

#### WSGroupUpdate
```python
class WSGroupUpdate(BaseModel):
    group_id: int  # 群聊ID
    update_type: str  # 更新类型
    data: Dict[str, Any]  # 更新数据
    timestamp: datetime  # 时间戳
```

#### WSOnlineStatus
```python
class WSOnlineStatus(BaseModel):
    user_id: int  # 用户ID
    online: bool  # 是否在线
    last_active: datetime  # 最后活动时间
```

## 9. 同步接口包装函数

为了在同步代码中调用异步的WebSocket功能，系统提供了以下同步包装函数:

### 9.1 ws_push_new_message

**功能**: 推送新消息给相关用户

**参数**:
- `db`: 数据库会话
- `message_id`: 消息ID
- `is_group`: 是否为群消息

**返回值**: `bool` - 是否推送成功

### 9.2 ws_push_group_update

**功能**: 推送群聊更新给所有群成员

**参数**:
- `db`: 数据库会话
- `group_id`: 群聊ID

**返回值**: `bool` - 是否推送成功

### 9.3 ws_push_member_joined

**功能**: 推送成员加入群聊的通知

**参数**:
- `db`: 数据库会话
- `group_id`: 群聊ID
- `user_id`: 用户ID

**返回值**: `bool` - 是否推送成功

### 9.4 ws_push_member_left

**功能**: 推送成员离开群聊的通知

**参数**:
- `db`: 数据库会话
- `group_id`: 群聊ID
- `user_id`: 用户ID

**返回值**: `bool` - 是否推送成功

### 9.5 ws_push_system_notification

**功能**: 推送系统通知

**参数**:
- `notification_type`: 通知类型
- `data`: 通知数据
- `user_ids`: 用户ID列表

**返回值**: `bool` - 是否推送成功

## 10. 注意事项

1. **消息格式**: 所有WebSocket消息必须符合JSON格式
2. **错误处理**: 客户端应妥善处理各种错误情况，包括连接断开、消息解析失败等
3. **心跳机制**: 客户端应定期发送心跳包以保持连接活跃
4. **重连逻辑**: 当连接断开时，客户端应实现自动重连机制
5. **消息幂等性**: 客户端应确保消息处理的幂等性，避免重复处理相同的消息
6. **安全考虑**: 所有敏感数据传输应进行加密，避免明文传输