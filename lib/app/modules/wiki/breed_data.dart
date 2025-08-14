import 'breed_models.dart';

final List<DogBreed> dogBreeds = [
  DogBreed(
    id: 'golden_retriever',
    name: '金毛寻回犬',
    aliases: ['金毛', 'Golden Retriever'],
    emoji: '🐕‍🦺',
    size: '大型',
    group: '寻回犬/猎犬',
    origin: '英国/苏格兰',
    lifespan: '10-12 年',
    temperament: ['友善', '温顺', '亲人', '聪明'],
    description: '金毛以温顺友善著称，智商高、学习能力强，适合家庭饲养，也常用于导盲和搜救工作。',
    guides: {
      GuideCategory.overview: [
        GuideItem(title: '基础概述', content: '金毛体格健壮，运动量中到高，适合有足够时间进行户外活动的家庭。'),
      ],
      GuideCategory.feeding: [
        GuideItem(title: '喂养建议', content: '幼犬阶段少食多餐，成犬控制体重，注意关节营养。'),
      ],
      GuideCategory.grooming: [
        GuideItem(title: '美容护理', content: '定期梳毛、洗澡与耳部清洁，换毛季需加强梳理。'),
      ],
      GuideCategory.training: [
        GuideItem(title: '训练要点', content: '服从性强，使用正向训练法，尽早社交化。'),
      ],
      GuideCategory.health: [
        GuideItem(title: '健康关注', content: '关注髋关节发育不良、耳道感染、肥胖等问题。'),
      ],
      GuideCategory.exercise: [
        GuideItem(title: '运动需求', content: '每日至少 60 分钟户外运动，游泳和捡回游戏是其最爱。'),
      ],
      GuideCategory.behavior: [
        GuideItem(title: '行为特征', content: '金毛天性友善，对陌生人也很友好，需要适当的社交训练。'),
      ],
      GuideCategory.social: [
        GuideItem(title: '社交需求', content: '喜欢与人互动，适合家庭环境，需要定期与其他狗狗社交。'),
      ],
    },
    trainingCourses: [
      TrainingCourse(
        id: 'golden_basic_1',
        title: '金毛基础服从训练',
        description: '针对金毛特点的基础训练课程，包括坐、卧、来等基本指令。',
        type: TrainingCourseType.basic,
        targetAge: DogAgeStage.puppy,
        duration: 45,
        instructor: '王训犬师',
        videoUrl: 'https://example.com/video1',
        tags: ['基础训练', '服从训练', '幼犬'],
        rating: 4.8,
        studentCount: 1250,
      ),
      TrainingCourse(
        id: 'golden_behavior_1',
        title: '金毛行为纠正指南',
        description: '解决金毛常见行为问题，如过度兴奋、分离焦虑等。',
        type: TrainingCourseType.behavior,
        targetAge: DogAgeStage.adult,
        duration: 60,
        instructor: '李训犬师',
        videoUrl: 'https://example.com/video2',
        tags: ['行为纠正', '情绪管理'],
        rating: 4.6,
        studentCount: 890,
      ),
      TrainingCourse(
        id: 'golden_social_1',
        title: '金毛社交技能训练',
        description: '提升金毛与其他狗狗和人类的社交能力。',
        type: TrainingCourseType.social,
        targetAge: DogAgeStage.adolescent,
        duration: 50,
        instructor: '张训犬师',
        videoUrl: 'https://example.com/video3',
        tags: ['社交训练', '互动技能'],
        rating: 4.7,
        studentCount: 756,
      ),
    ],
    behaviorGuides: [
      BehaviorGuide(
        id: 'golden_behavior_1',
        title: '金毛幼犬行为解读',
        content: '金毛幼犬活泼好动，需要大量关注和互动。这个阶段是建立良好行为习惯的关键期...',
        targetAge: DogAgeStage.puppy,
        tags: ['幼犬', '行为解读', '习惯养成'],
        author: '王训犬师',
        createdAt: DateTime(2024, 1, 15),
      ),
      BehaviorGuide(
        id: 'golden_behavior_2',
        title: '金毛分离焦虑解决方案',
        content: '金毛容易产生分离焦虑，表现为主人离开时的过度吠叫、破坏行为等...',
        targetAge: DogAgeStage.adult,
        tags: ['分离焦虑', '情绪管理', '行为纠正'],
        author: '李训犬师',
        createdAt: DateTime(2024, 2, 20),
      ),
    ],
    socialActivities: [
      SocialActivity(
        id: 'golden_social_1',
        title: '金毛公园社交活动',
        description: '在安全的环境中让金毛与其他狗狗互动，提升社交技能。',
        targetAge: DogAgeStage.adolescent,
        difficulty: 2,
        duration: 30,
        benefits: ['提升社交能力', '减少焦虑', '增强自信'],
        requirements: ['基础服从训练', '健康证明', '牵引绳'],
      ),
      SocialActivity(
        id: 'golden_social_2',
        title: '金毛游泳训练',
        description: '利用金毛天生的游泳天赋，进行水上运动和训练。',
        targetAge: DogAgeStage.adult,
        difficulty: 3,
        duration: 45,
        benefits: ['全身运动', '关节保护', '降温消暑'],
        requirements: ['安全水域', '救生衣', '基础游泳技能'],
      ),
    ],
    shedding: 4,
    grooming: 3,
    energy: 4,
    trainability: 5,
    barkLevel: 2,
  ),
  DogBreed(
    id: 'poodle_toy',
    name: '贵宾犬（玩具型）',
    aliases: ['泰迪', 'Toy Poodle'],
    emoji: '🐩',
    size: '小型',
    group: '伴侣犬',
    origin: '法国/德国',
    lifespan: '12-15 年',
    temperament: ['聪明', '活泼', '粘人'],
    description: '智商高、可塑性强，适合城市家庭，注意泪痕与牙石问题。',
    guides: {
      GuideCategory.overview: [
        GuideItem(title: '基础概述', content: '体型小巧，性格友善，需较多互动。'),
      ],
      GuideCategory.grooming: [
        GuideItem(title: '美容护理', content: '卷毛需定期修剪与梳理，避免打结。'),
      ],
      GuideCategory.feeding: [
        GuideItem(title: '喂养建议', content: '控制零食，预防肥胖与牙结石。'),
      ],
      GuideCategory.behavior: [
        GuideItem(title: '行为特征', content: '聪明但敏感，需要温和的训练方式。'),
      ],
      GuideCategory.social: [
        GuideItem(title: '社交需求', content: '喜欢与主人互动，适合室内活动。'),
      ],
    },
    trainingCourses: [
      TrainingCourse(
        id: 'poodle_basic_1',
        title: '贵宾犬基础训练',
        description: '针对贵宾犬高智商特点的基础训练课程。',
        type: TrainingCourseType.basic,
        targetAge: DogAgeStage.puppy,
        duration: 30,
        instructor: '陈训犬师',
        videoUrl: 'https://example.com/video4',
        tags: ['基础训练', '高智商', '小型犬'],
        rating: 4.9,
        studentCount: 2100,
      ),
    ],
    behaviorGuides: [
      BehaviorGuide(
        id: 'poodle_behavior_1',
        title: '贵宾犬敏感性格处理',
        content: '贵宾犬性格敏感，需要温和的训练方式和稳定的环境...',
        targetAge: DogAgeStage.puppy,
        tags: ['敏感性格', '温和训练', '环境适应'],
        author: '陈训犬师',
        createdAt: DateTime(2024, 1, 10),
      ),
    ],
    socialActivities: [
      SocialActivity(
        id: 'poodle_social_1',
        title: '贵宾犬室内互动游戏',
        description: '适合贵宾犬的室内互动游戏，提升智力发展。',
        targetAge: DogAgeStage.adult,
        difficulty: 1,
        duration: 20,
        benefits: ['智力发展', '情感交流', '室内运动'],
        requirements: ['安静环境', '互动玩具', '耐心'],
      ),
    ],
    shedding: 1,
    grooming: 4,
    energy: 3,
    trainability: 5,
    barkLevel: 3,
  ),
  DogBreed(
    id: 'corgi',
    name: '威尔士柯基犬',
    aliases: ['柯基', 'Corgi'],
    emoji: '🐶',
    size: '中型',
    group: '牧羊犬',
    origin: '英国/威尔士',
    lifespan: '12-14 年',
    temperament: ['活泼', '机警', '粘人'],
    description: '短腿长身，个性外向，掉毛较多，需要控制体重，注意脊椎健康。',
    guides: {
      GuideCategory.overview: [
        GuideItem(title: '基础概述', content: '社交性强，喜欢与人互动。'),
      ],
      GuideCategory.health: [
        GuideItem(title: '健康关注', content: '注意脊椎负担，避免高强度跳跃。'),
      ],
      GuideCategory.exercise: [
        GuideItem(title: '运动需求', content: '每日 40-60 分钟中等强度运动。'),
      ],
      GuideCategory.behavior: [
        GuideItem(title: '行为特征', content: '牧羊犬天性，喜欢追逐和驱赶行为。'),
      ],
      GuideCategory.social: [
        GuideItem(title: '社交需求', content: '需要与其他狗狗和人类充分互动。'),
      ],
    },
    trainingCourses: [
      TrainingCourse(
        id: 'corgi_basic_1',
        title: '柯基牧羊本能训练',
        description: '利用柯基的牧羊本能，进行专业训练。',
        type: TrainingCourseType.special,
        targetAge: DogAgeStage.adolescent,
        duration: 55,
        instructor: '刘训犬师',
        videoUrl: 'https://example.com/video5',
        tags: ['牧羊训练', '特殊技能', '本能开发'],
        rating: 4.5,
        studentCount: 634,
      ),
    ],
    behaviorGuides: [
      BehaviorGuide(
        id: 'corgi_behavior_1',
        title: '柯基牧羊行为管理',
        content: '柯基具有强烈的牧羊本能，会追逐移动的物体，需要适当引导...',
        targetAge: DogAgeStage.adult,
        tags: ['牧羊本能', '行为管理', '本能引导'],
        author: '刘训犬师',
        createdAt: DateTime(2024, 3, 5),
      ),
    ],
    socialActivities: [
      SocialActivity(
        id: 'corgi_social_1',
        title: '柯基群体活动',
        description: '让柯基参与群体活动，满足其社交需求。',
        targetAge: DogAgeStage.adult,
        difficulty: 2,
        duration: 40,
        benefits: ['社交满足', '能量释放', '群体适应'],
        requirements: ['群体环境', '安全监督', '基础训练'],
      ),
    ],
    shedding: 5,
    grooming: 2,
    energy: 3,
    trainability: 4,
    barkLevel: 3,
  ),
];

final List<String> sizes = ['全部', '小型', '中型', '大型'];

final List<GuideCategory> allGuideCategories = const [
  GuideCategory.overview,
  GuideCategory.feeding,
  GuideCategory.grooming,
  GuideCategory.training,
  GuideCategory.health,
  GuideCategory.living,
  GuideCategory.exercise,
  GuideCategory.behavior,
  GuideCategory.social,
];

String guideCategoryLabel(GuideCategory c) {
  switch (c) {
    case GuideCategory.overview:
      return '概述';
    case GuideCategory.feeding:
      return '喂养';
    case GuideCategory.grooming:
      return '美容';
    case GuideCategory.training:
      return '训练';
    case GuideCategory.health:
      return '健康';
    case GuideCategory.living:
      return '居家';
    case GuideCategory.exercise:
      return '运动';
    case GuideCategory.behavior:
      return '行为';
    case GuideCategory.social:
      return '社交';
  }
}
