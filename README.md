[![Stories in Ready](https://badge.waffle.io/cycorld/Unlock-n-ROR.png?label=ready&title=Ready)](http://waffle.io/cycorld/Unlock-n-ROR)

# RORLAB을 위한 질문/답변 서비스 : **Unlock'n RoR**

## Unlock'n RoR
**Unlock'n RoR**의 이름은 해결하다라는 의미의 **"Unlock"**과 루비온레일즈의 약자인 **"RoR"** 에다가 작명자의 락큰롤 사랑이 더해져 **Unlock'n RoR**이 만들어졌습니다.

## 프로젝트 컨셉 소개

루비온레일즈에 대한 질문을 올리면 그에 대한 답변을 하고 포인트를 얻는 Stackoverflow와 유사한 방식의 서비스입니다.

하지만 Stackoverflow는 영어기반 서비스라서 영어가 약하거나 레일즈에 관한 용어를 모른다면 보기가 힘듭니다.

그리고 Hashcode라는 유사 서비스가 있습니다. 하지만 Unlock'n RoR 서비스는 루비온레일즈에 대해서 좀 더 자세히 다룰 것입니다.

만약 사용자가 질문을 올렸다면 RORLAB 슬랙에 봇을 이용해 알림이 가게끔 만들어서 질문에 대한 답변을 최대한 신속하고 정확하게 알 수 있도록 할 예정입니다.

## 기능 소개

개발자들 위주의 서비스이기 때문에 Devise gem을 이용한 Github/Facebook/Twitter 로그인과
질문을 게시하고 질문의 업(like)/다운(dislike)을 구현할 것입니다.

그리고 질문에 대한 답변과 답변의 업/다운도 마찬가지입니다.

마크다운 파서/편집기를 붙이고 이미지 업로드 기능을 붙일 예정입니다.

질문 등록시 RORLAB의 슬랙 특정 채널에 봇 푸쉬 알림을 보냄으로써 신속정확한 답변을 달 수 있도록 유도합니다.

그리고 답변 등록시 질문자에게 이메일 알림을 보내서 빠르게 답변을 확인할 수 있도록 합니다.

Stackoverflow에도 있듯이 채택 시 포인트 지급해서 포인트로 랭킹을 표시할 예정입니다.

액션 케이블을 사용해서 사용자 간 다이렉트 메시징도 구현할 예정입니다.

질문의 방향을 알기 위해서 질문 태그 기능과 더욱 쉬운 검색을 위해서 태그 기반 검색 기능도 추가할 것입니다.

## 협업툴 소개

Slack의 채널을 이용해서 대화하고, Git&Github를 이용한 소스코드 관리를 합니다.

그리고 Waffle을 이용해서 Issue들을 관리합니다.

## Versions

- Ruby 2.3.0
- Rails 5.0.0.rc1

## Getting Started

### Install Rails 5 (rc1)

```
$ gem install rails --pre
```

### Run in development

```
$ git clone https://github.com/cycorld/Unlock-n-ROR.git
$ cd Unlock-n-ROR
$ bundle install
$ rails s
```

### Gems used

- [devise](https://github.com/plataformatec/devise)
- [omniauth-github](https://github.com/intridea/omniauth-github)
- [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)
- [omniauth-twitter](https://github.com/arunagw/omniauth-twitter)
- [ckeditor](https://github.com/galetahub/ckeditor)
- [acts_as_votable](https://github.com/ryanto/acts_as_votable)
- [acts_as_taggable](https://github.com/mbleigh/acts-as-taggable-on)
- [will_paginate](https://github.com/mislav/will_paginate)
- [rails_admin](https://github.com/sferik/rails_admin)

### References

- [Devise에 oauth 적용하기](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)

### Mockups

- [목업](https://ovenapp.io/project/25ZTYmFFHY8mJ4lsUqSAse8q406Q3WAj#GSgsM)
