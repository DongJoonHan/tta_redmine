# tta_redmine

# docker에서 Redmine을 사용하기 위한 사전 설치
```
apt-get update && apt-get install -y build-essential libpq-dev libxml2-dev libxslt-dev libyaml-dev
```

# Plugin

Plugins 폴더 접근
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

# Agile
설치방법: [https://www.redmineup.com/pages/help/agile/installing-redmine-agile-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide](https://www.redmineup.com/pages/help/agile/installing-redmine-agile-plugin-on-linux?utm_source=Main&utm_medium=email&utm_campaign=Download_plugin_email&utm_term=download_plugin_email&utm_content=installation_guide)

## DMSF
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
