# tta_redmine

# docker에서 Redmine을 사용하기 위한 사전 설치
```
apt-get update && apt-get install -y build-essential libpq-dev libxml2-dev libxslt-dev libyaml-dev
```

# Plugin

Redmine Container의 Bash 실행(Container 내부 접근 /  Plugins 폴더 접근)
```sh
docker exec -it redmine bash
```

## Dynamic Issue Edit
- 공홈: https://github.com/Ilogeek/redmine_issue_dynamic_edit

### Git Clone 명령
plugins 폴더에서
```
git clone https://github.com/Ilogeek/redmine_issue_dynamic_edit.git
```

## Checklist
설치 방법: [https://www.redmineup.com/pages/help/checklists/installing-redmine-checklists-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide](https://www.redmineup.com/pages/help/checklists/installing-redmine-checklists-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide)

- Bundle 설치
```sh
bundle install --without development test --no-deployment
```

- DB 마이그레이션
```
bundle exec rake redmine:plugins NAME=redmine_checklists RAILS_ENV=production
```

- 만약 체크리스트 추가가 안되는 경우 다음 명령 추가 실행
```
bundle exec rake assets:precompile RAILS_ENV=production
```

## Agile
설치방법: [https://www.redmineup.com/pages/help/agile/installing-redmine-agile-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide](https://www.redmineup.com/pages/help/agile/installing-redmine-agile-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide)

- Bundle 설치
```sh
bundle install --without development test --no-deployment
```

- DB 마이그레이션
```
bundle exec rake redmine:plugins NAME=redmine_agile RAILS_ENV=production
```

## DMSF
- 우리가 사용한 Redmine은 6.0.7이어서, DMSF 플러그인은 최신 버전이 아닌 버전 지원하는 4.2.2 버전 사용
- 다운로드 링크: https://github.com/picman/redmine_dmsf/archive/refs/tags/v4.2.2.zip 

- 설치 bundle 권한 설정
```sh
chmod 1777 /usr/local/bundle/gems
chmod 1777 /usr/local/bundle/extensions/x86_64-linux/3.3.0
```

- full Text 검색 제외 설치
```sh
bundle config set --local without 'xapian'
bundle install
```

- Initialize/Update database:
```sh
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=redmine_dmsf
```

- Install assets
```sh
RAILS_ENV="production" bundle exec rake assets:precompile
```

- 권한 부여:
```sh
chown -R www-data:www-data plugins/redmine_dmsf
```

# Issue Template
- 공식 Redmine 링크: https://www.redmine.org/plugins/redmine_issue_templates
- 플러그인 홈페이지: https://github.com/agileware-jp/redmine_issue_templates
- 플러그인 다운로드 링크: https://github.com/agileware-jp/redmine_issue_templates/archive/refs/tags/1.2.1.zip

- 설치 방법
```
rails redmine:plugins:migrate RAILS_ENV=production
```

- 만약 안되는 경우, 프리컴파일 실기
```
RAILS_ENV="production" bundle exec rake assets:precompile
``` 
