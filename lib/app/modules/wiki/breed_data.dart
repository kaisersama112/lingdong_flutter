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
    },
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
    },
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
    },
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
  }
}
