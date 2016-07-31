# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'sharcik14@gmail.com', password: '987654321', password_confirmation: '987654321')

University.create!([{"id":10,"name":"Гродненский государственный университет имени Янки Купалы","short_name":"ГрГУ","description":"Гродненский государственный университет имени Янки Купалы – одно из старейших высших учебных заведений на территории Республики Беларусь, находится в городе Гродно. Имеет международные сертификаты соответствия системы менеджмента качества требованиям (Серия стандартов ISO 9000). В 2011 году стал первым среди высших учебных заведений Республики Беларусь лауреатом конкурса «Премия Правительства Республики Беларусь за достижения в области качества». Первыми после БГУ ввели системы электронных студенческих билетов. Занимает 2-е место среди лучших университетов Беларуси и 1861 место в мире среди 12.000 университетов.","image":{"url":"/uploads/university/image/10/______.jpg","normal":{"url":"/uploads/university/image/10/normal_______.jpg"},"serv":{"url":"/uploads/university/image/10/serv_______.jpg"}},"created_at":"2016-06-29T11:11:47.155Z","updated_at":"2016-07-11T18:25:12.023Z","city_id":2,"address":"г. Гродно, Ожешко, 22","preparatory_department":true,"hostel":true,"rating":10,"magistracy":false,"initial_cost":1870,"ochno":true,"zaochno":true},{"id":8,"name":"Белорусский государственный экономический университет","short_name":"БГЭУ","description":"Белорусский государственный экономический университет - одно из самых крупнейших учебных заведений на территории Республики Беларусь. Одно из самых популярных мест для поступления среди жителей Минска, а так же областей. Данный университет имеет в своем составе 11 факультетов и каждый абитуриент выбравший данное учебное заведение сможет с легкостью определиться с выбором специальности, начиная от банковского дела и заканчивая международной бизнес коммуникацией. Данный университет пользуется своим успехом у иностранных граждан, которые приезжают в РБ с целью получения высшего образования в престижном ВУЗе.","image":{"url":"/uploads/university/image/8/____.jpg","normal":{"url":"/uploads/university/image/8/normal_____.jpg"},"serv":{"url":"/uploads/university/image/8/serv_____.jpg"}},"created_at":"2016-06-19T10:12:54.586Z","updated_at":"2016-07-11T18:15:59.653Z","city_id":1,"address":"г. Минск, Партизанский, 26","preparatory_department":true,"hostel":true,"rating":null,"magistracy":false,"initial_cost":2000,"ochno":true,"zaochno":true},{"id":7,"name":"Белорусский государственный университет информатики и радиоэлектроники","short_name":"БГУИР","description":"Белорусский государственный университет информатики и радиоэлектроники – ведущее высшее учебное заведение Беларуси в области компьютерных технологий и электроники. В данном учебном заведении обучается около 15.300 студентов ежегодно и из них около 400 человек из стран ближнего и дальнего зарубежья. Является одним из лучших учебных заведений Республики Беларусь. Выпускники данного ВУЗа нередко становятся успешными программистами, занятые в Парке Высоких Технологий РБ. Данное учебное заведение идет в ногу со временем и часто организовывает международные научные конференции, семинары по инновационным направлениям/технологиям.","image":{"url":"/uploads/university/image/7/_____.jpg","normal":{"url":"/uploads/university/image/7/normal______.jpg"},"serv":{"url":"/uploads/university/image/7/serv______.jpg"}},"created_at":"2016-06-16T15:54:44.717Z","updated_at":"2016-07-27T14:00:03.600Z","city_id":1,"address":"г. Минск, Бровки, 6","preparatory_department":true,"hostel":true,"rating":null,"magistracy":true,"initial_cost":2000,"ochno":true,"zaochno":true},{"id":6,"name":"Минский государственный лингвистический университет","short_name":"МГЛУ","description":"Минский государственный лингвистический университет – высшее учебное заведение, находящееся в городе Минске. В данном университете готовят кадров в области педагогики и перевода. Для иностранных студентов данный ВУЗ будет очень привлекательным тем, что МГЛУ является главным центром по подготовке студентов со всех континентов мира. Со дня основания в 1948 году данный лингвистический университет успел подготовить около 25500 учителей и около 2600 переводчиков-референтов. Также данный университет носит звание главного центра по подготовке студентов по иностранным языкам. МГЛУ часто проводит различные международные конференции куда приглашаются специалисты из России, Канады, Бельгии, Германии и др. Каждый студент обязан изучать 2 иностранных языка весь срок обучения, однако при хорошей успеваемости имеет право выбрать и 3-й. Данный университет всячески поощряет углубленное изучение языков и создает все условия для этого.","image":{"url":"/uploads/university/image/6/____.jpg","normal":{"url":"/uploads/university/image/6/normal_____.jpg"},"serv":{"url":"/uploads/university/image/6/serv_____.jpg"}},"created_at":"2016-06-11T20:56:08.291Z","updated_at":"2016-07-27T14:28:35.416Z","city_id":1,"address":"г. Минск, Захарова, 21","preparatory_department":true,"hostel":true,"rating":null,"magistracy":false,"initial_cost":2200,"ochno":true,"zaochno":false},{"id":5,"name":"Белорусский государственный университет","short_name":"БГУ","description":"Белорусский государственный университет (белор. Беларускі дзяржаўны ўніверсітэт) — Ведущий вуз Республики Беларусь расположенный в Минске. Открыт 30 октября 1921 года. Вошел в ТОП-3 ведущих университетов по СНГ на состояние 2015 г. Является гордостью среди образовательных учреждений по Беларуси. Проводит подготовку по специальностям начиная от «Международное право» - до обучения в магистратуре по специальностям «Технологии управления персоналом». Студсоюз данного университета постоянно проводит различные активные мероприятия, которые способствуют тому, что БГУ становится не просто учебным учреждением, но и тем местом, где студенты при желании могут проявить свои личностные качества. Студентам, которые показывают успехи в учебной деятельности получают право посещения спортивным залом, а так же бассейна.","image":{"url":"/uploads/university/image/5/___.jpg","normal":{"url":"/uploads/university/image/5/normal____.jpg"},"serv":{"url":"/uploads/university/image/5/serv____.jpg"}},"created_at":"2016-06-11T20:28:21.349Z","updated_at":"2016-07-11T18:21:59.285Z","city_id":1,"address":"г. Минск, пр. Независимости, 4б","preparatory_department":true,"hostel":true,"rating":null,"magistracy":false,"initial_cost":2300,"ochno":true,"zaochno":true}])

City.create!([{"id":2,"name":"Гродно","image_city":{"url":null,"normal":{"url":null},"serv":{"url":null}},"created_at":"2016-06-29T11:08:14.623Z","updated_at":"2016-06-29T11:08:14.623Z"},{"id":1,"name":"Минск","image_city":{"url":"/uploads/city/image_city/1/minsk.jpg","normal":{"url":"/uploads/city/image_city/1/normal_minsk.jpg"},"serv":{"url":"/uploads/city/image_city/1/serv_minsk.jpg"}},"created_at":"2016-06-18T16:38:35.531Z","updated_at":"2016-06-18T16:38:35.531Z"}])

Departament.create!([{"id":11,"name":"Факультет английского языка","created_at":"2016-07-27T14:29:15.095Z","updated_at":"2016-07-27T14:29:15.095Z","university_id":6},{"id":10,"name":"Педагогический факультет","created_at":"2016-07-27T14:19:20.289Z","updated_at":"2016-07-27T14:19:20.289Z","university_id":10},{"id":9,"name":"Фaкультет телекоммуникаций","created_at":"2016-07-27T14:03:28.902Z","updated_at":"2016-07-27T14:03:28.902Z","university_id":7},{"id":8,"name":"Учетно-экономический факультет","created_at":"2016-07-27T13:39:19.451Z","updated_at":"2016-07-27T13:39:19.451Z","university_id":8},{"id":7,"name":"Инженерно-строительный факультет","created_at":"2016-07-11T18:25:59.363Z","updated_at":"2016-07-11T18:25:59.363Z","university_id":10},{"id":6,"name":"Переводческий факультет","created_at":"2016-07-11T18:18:24.478Z","updated_at":"2016-07-11T18:18:24.478Z","university_id":6},{"id":5,"name":"Инженерно-экономический факультет","created_at":"2016-07-06T14:32:07.977Z","updated_at":"2016-07-06T14:32:07.977Z","university_id":7},{"id":3,"name":"Институт социально-гуманитарного образования","created_at":"2016-06-19T10:14:10.867Z","updated_at":"2016-06-30T12:38:28.381Z","university_id":8},{"id":2,"name":"Географический факультет","created_at":"2016-06-18T13:50:51.794Z","updated_at":"2016-06-18T13:50:51.794Z","university_id":5},{"id":1,"name":"Биологический факультет","created_at":"2016-06-16T16:12:12.820Z","updated_at":"2016-06-16T20:09:07.636Z","university_id":5}])

Magistracy.create!([{"id":3,"created_at":"2016-07-27T14:15:40.117Z","updated_at":"2016-07-27T14:15:40.117Z","name":"Инфокоммуникационные системы и сети","profession":"Магистр технических наук","training_period":1,"ochno":true,"zaochno":true,"ochno_price":3300,"zaochno_price":3300,"departament_id":9,"training_period_zaochno":2},{"id":2,"created_at":"2016-07-27T14:02:47.784Z","updated_at":"2016-07-27T14:02:47.784Z","name":"Экономика и организация производства","profession":"Магистр (по отраслям наук): экономических, технических","training_period":1,"ochno":true,"zaochno":true,"ochno_price":3300,"zaochno_price":3300,"departament_id":5,"training_period_zaochno":2},{"id":1,"created_at":"2016-07-06T14:34:50.863Z","updated_at":"2016-07-06T19:53:43.539Z","name":"Математические и инструментальные методы экономики","profession":"Магистр экономических наук","training_period":1,"ochno":true,"zaochno":true,"ochno_price":3300,"zaochno_price":3300,"departament_id":5,"training_period_zaochno":2}])

Specialty.create!([{"id":13,"name":"Современные иностранные языки. Английский язык и второй иностранный язык со специализаций","departament_id":11,"created_at":"2016-07-27T14:29:43.949Z","updated_at":"2016-07-27T14:29:43.949Z","profession":"Лингвист, Преподаватель двух иностранных языков","training_period":5,"ochno":true,"zaochno":false,"ochno_price":2530,"zaochno_price":null,"training_period_zaochno":null},{"id":12,"name":"Дошкольное образование","departament_id":10,"created_at":"2016-07-27T14:20:00.684Z","updated_at":"2016-07-27T14:20:00.684Z","profession":"Педагог","training_period":4,"ochno":true,"zaochno":true,"ochno_price":2250,"zaochno_price":1400,"training_period_zaochno":5},{"id":11,"name":"Защита информации в телекоммуникациях","departament_id":9,"created_at":"2016-07-27T14:14:40.465Z","updated_at":"2016-07-27T14:14:40.465Z","profession":"Специалист по защите информации, Инженер по телекоммуникациям","training_period":4,"ochno":true,"zaochno":false,"ochno_price":3000,"zaochno_price":null,"training_period_zaochno":null},{"id":10,"name":"Информационные системы и технологии (в экономике)","departament_id":5,"created_at":"2016-07-27T14:01:38.271Z","updated_at":"2016-07-27T14:01:38.271Z","profession":"Инженер-программист-экономист","training_period":4,"ochno":true,"zaochno":true,"ochno_price":3000,"zaochno_price":1800,"training_period_zaochno":5},{"id":9,"name":"Бухгалтерский учет, анализ и аудит в коммерческих и некоммерческих организациях","departament_id":8,"created_at":"2016-07-27T13:43:05.953Z","updated_at":"2016-07-27T13:43:05.953Z","profession":"Экономист","training_period":4,"ochno":true,"zaochno":true,"ochno_price":2800,"zaochno_price":2200,"training_period_zaochno":5},{"id":8,"name":"Бухгалтерский учет, анализ и аудит в бюджетных организациях","departament_id":8,"created_at":"2016-07-27T13:40:03.025Z","updated_at":"2016-07-27T13:40:03.025Z","profession":"Экономист","training_period":4,"ochno":true,"zaochno":false,"ochno_price":2800,"zaochno_price":null,"training_period_zaochno":null},{"id":7,"name":"Промышленное и гражданское строительство","departament_id":7,"created_at":"2016-07-11T18:26:59.443Z","updated_at":"2016-07-11T18:26:59.443Z","profession":"Инженер-строитель","training_period":5,"ochno":true,"zaochno":true,"ochno_price":2250,"zaochno_price":1400,"training_period_zaochno":6},{"id":6,"name":"География (научно-педагогическая деятельность)","departament_id":2,"created_at":"2016-07-11T18:22:57.017Z","updated_at":"2016-07-11T18:22:57.017Z","profession":"Географ, Преподаватель географии","training_period":4,"ochno":true,"zaochno":false,"ochno_price":2850,"zaochno_price":null,"training_period_zaochno":null},{"id":5,"name":"Современные иностранные языки (Английский язык и второй иностранный язык со специализацией)","departament_id":6,"created_at":"2016-07-11T18:19:27.674Z","updated_at":"2016-07-11T18:19:27.674Z","profession":"Лингвист, переводчик","training_period":5,"ochno":true,"zaochno":false,"ochno_price":2530,"zaochno_price":null,"training_period_zaochno":null},{"id":4,"name":"Информационные системы и технологии (в логистике)","departament_id":5,"created_at":"2016-07-06T14:33:10.780Z","updated_at":"2016-07-06T14:33:10.780Z","profession":"Системный программист-логистик","training_period":4,"ochno":true,"zaochno":false,"ochno_price":3000,"zaochno_price":null,"training_period_zaochno":null},{"id":3,"name":"Биология (научно-педагогическая деятельность)","departament_id":1,"created_at":"2016-06-20T14:08:12.768Z","updated_at":"2016-06-20T14:08:12.768Z","profession":"Биология, Преподаватель биологии и химии","training_period":5,"ochno":true,"zaochno":true,"ochno_price":2850,"zaochno_price":1950,"training_period_zaochno":null},{"id":2,"name":"Политология","departament_id":3,"created_at":"2016-06-19T10:15:13.818Z","updated_at":"2016-06-19T10:15:13.818Z","profession":"Политолог-менеджер","training_period":4,"ochno":true,"zaochno":false,"ochno_price":2800,"zaochno_price":null,"training_period_zaochno":null},{"id":1,"name":"Биология (биотехнология)","departament_id":1,"created_at":"2016-06-17T07:03:26.529Z","updated_at":"2016-06-20T08:16:58.860Z","profession":"Биолог-биотехнолог, Преподаватель биологии","training_period":5,"ochno":true,"zaochno":true,"ochno_price":2300,"zaochno_price":2000,"training_period_zaochno":null}])

New.create!([{"id":2,"name":"Рейтинг университетов РБ по версии MyUniver.by ","description":"\u003cspan\u003e\u003cp\u003e\u003cstrong\u003eГрафик проведения централизованного тестирования по учебным предметам в 2016 году.\u003c/strong\u003e\u003c/p\u003e\r\n\r\n\u003cp\u003eПостановлением Министерства образования Республики Беларусь от 2 \r\nфевраля 2016 г. № 6 утверждены перечень учреждений образования, \r\nопределенных пунктами проведения централизованного тестирования (ЦТ), и \r\nграфик проведения ЦТ.\u003c/p\u003e\r\n\u003cp\u003eЦТ по учебным предметам в 2016 году будет проведено по следующему графику:\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eБелорусский язык\u003c/strong\u003e» – \u003cstrong\u003e13 июня\u003c/strong\u003e (понедельник);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eРусский язык\u003c/strong\u003e» – \u003cstrong\u003e14 июня\u003c/strong\u003e (вторник);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eОбществоведение\u003c/strong\u003e» – \u003cstrong\u003e16 июня\u003c/strong\u003e (четверг);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eБиология\u003c/strong\u003e» – \u003cstrong\u003e18 июня\u003c/strong\u003e (суббота);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eМатематика\u003c/strong\u003e» – \u003cstrong\u003e19 июня\u003c/strong\u003e (воскресенье);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eИстория Беларуси\u003c/strong\u003e» – \u003cstrong\u003e21 июня\u003c/strong\u003e (вторник);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eХимия\u003c/strong\u003e» – \u003cstrong\u003e23 июня\u003c/strong\u003e (четверг);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eФизика\u003c/strong\u003e» – \u003cstrong\u003e24 июня\u003c/strong\u003e (пятница);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eИностранный язык (английский, немецкий, французский, испанский, китайский)\u003c/strong\u003e» – \u003cstrong\u003e25 июня\u003c/strong\u003e(суббота);\u003c/p\u003e\r\n\u003cp\u003e«\u003cstrong\u003eВсемирная история (новейшее время)\u003c/strong\u003e» и «\u003cstrong\u003eГеография\u003c/strong\u003e» – \u003cstrong\u003e27 июня\u003c/strong\u003e (понедельник).\u003c/p\u003e\r\n\u003cp\u003eВремя начала ЦТ – \u003cstrong\u003e11.00\u003c/strong\u003e.\u003c/p\u003e\r\n\u003cp\u003eДата резервного дня – \u003cstrong\u003e5 июля 2016 г. \u003c/strong\u003e(вторник); сроки регистрации абитуриентов для прохождения ЦТ в резервный день – \u003cstrong\u003eс 28 июня по 1 июля 2016 г.\u003c/strong\u003e\u003c/p\u003e\r\n\u003cp\u003eПунктами регистрации для прохождения ЦТ в резервный день определены следующие учреждения образования:\u003c/p\u003e\r\n\u003cp\u003eБелорусский государственный университет; государственное учреждение \r\nвысшего профессионального образования «Белорусско-Российский \r\nуниверситет»;\u003c/p\u003e\r\n\u003cp\u003eучреждение образования «Брестский государственный технический университет»;\u003c/p\u003e\r\n\u003cp\u003eучреждение образования «Гродненский государственный университет имени Янки Купалы»;\u003c/p\u003e\r\n\u003cp\u003eучреждение образования «Витебский государственный технологический университет»;\u003c/p\u003e\r\n\u003cp\u003eучреждение образования «Гомельский государственный технический университет имени П.О.Сухого».\u003c/p\u003e\r\n\u003cp\u003eВ свою очередь, пунктом проведения ЦТ в резервный день определен Белорусский государственный университет.\u003c/p\u003e\r\n\u003cp\u003eУстановлен следующий режим работы пунктов регистрации: \u003cstrong\u003eс 9.00 до 19.00\u003c/strong\u003e; в субботние (14 и 28 мая) и воскресные (22 мая) дни – \u003cstrong\u003eс 9.00 до 18.00\u003c/strong\u003e.\u003c/p\u003e\r\n\u003cp\u003eТакже Постановлением определен перечень учреждений образования, координирующих подготовку и проведение ЦТ в областях и г. Минске, и \r\nминимальное количество мест для абитуриентов в пунктах проведения ЦТ.\u003c/p\u003e\u003c/span\u003e","news_image":{"url":"/uploads/new/news_image/2/______.jpg","normal":{"url":"/uploads/new/news_image/2/normal_______.jpg"},"serv":{"url":"/uploads/new/news_image/2/serv_______.jpg"}},"created_at":"2016-07-03T16:36:54.639Z","updated_at":"2016-07-15T10:10:02.642Z","short_description":"Расписание и проведение централизованного тестирования: место и время , список всех необходимых документов, онлайн регистрация заявок."},{"id":1,"name":"Сроки подачи документов для ЦТ 2016","description":"","news_image":{"url":"/uploads/new/news_image/1/____.jpg","normal":{"url":"/uploads/new/news_image/1/normal_____.jpg"},"serv":{"url":"/uploads/new/news_image/1/serv_____.jpg"}},"created_at":"2016-07-03T15:56:54.233Z","updated_at":"2016-07-03T16:01:04.058Z","short_description":"Расписание и проведение централизованного тестирования: место и время , список всех необходимых документов, онлайн регистрация заявок."}])