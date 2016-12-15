source .env
sed 's/_TMPL_SIMNOW_ID_/'"$ENV_SIMNOW_ID"'/' CTP_connect.json.tmpl | \
sed 's/_TMPL_SIMNOW_PW_/'"$ENV_SIMNOW_PW"'/' > CTP_connect.json
docker-compose up