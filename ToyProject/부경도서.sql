DROP TABLE "BookInfo";

CREATE TABLE "BookInfo" (
	"book_id"	number		NOT NULL,
	"pub_id"	number		NOT NULL,
	"book_name"	varchar2(100)		NOT NULL,
	"book_price"	number(8,0)	DEFAULT 0	NOT NULL,
	"author"	varchar2(100)		NULL,
	"release_dt"	date		NULL
);

COMMENT ON COLUMN "BookInfo"."book_id" IS '도서정보키';

COMMENT ON COLUMN "BookInfo"."book_name" IS '도서명필드';

COMMENT ON COLUMN "BookInfo"."book_price" IS '도서단가';

DROP TABLE "CustomerInfo";

CREATE TABLE "CustomerInfo" (
	"cst_id"	number		NOT NULL,
	"cst_name"	varchar2(100)		NOT NULL,
	"cst_addr"	varchar2(100)		NOT NULL,
	"cst_tel"	varchar2(20)		NULL
);

COMMENT ON COLUMN "CustomerInfo"."cst_name" IS '고객명';

DROP TABLE "PublishCompInfo";

CREATE TABLE "PublishCompInfo" (
	"pub_id"	number		NOT NULL,
	"pub_name"	varchar2(100)		NOT NULL,
	"pub_ceo"	varchar2(100)		NULL,
	"pub_tel"	varchar2(20)		NULL,
	"pub_addr"	varchar2(100)		NULL
);

COMMENT ON COLUMN "PublishCompInfo"."pub_ceo" IS '담당자명';

DROP TABLE "OrderInfo";

CREATE TABLE "OrderInfo" (
	"ord_id"	number		NOT NULL,
	"book_id"	number		NOT NULL,
	"cst_id"	number		NOT NULL,
	"ord_dt"	date		NULL,
	"ord_price"	number		NULL
);

COMMENT ON COLUMN "OrderInfo"."book_id" IS '도서정보키';

DROP TABLE "ManagerInfo";

CREATE TABLE "ManagerInfo" (
	"mng_id"	number		NOT NULL,
	"pub_id"	number		NOT NULL,
	"mng_name"	varchar2(100)		NOT NULL,
	"mng_tel"	varchar2(20)		NOT NULL
);

ALTER TABLE "BookInfo" ADD CONSTRAINT "PK_BOOKINFO" PRIMARY KEY (
	"book_id"
);

ALTER TABLE "CustomerInfo" ADD CONSTRAINT "PK_CUSTOMERINFO" PRIMARY KEY (
	"cst_id"
);

ALTER TABLE "PublishCompInfo" ADD CONSTRAINT "PK_PUBLISHCOMPINFO" PRIMARY KEY (
	"pub_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "PK_ORDERINFO" PRIMARY KEY (
	"ord_id"
);

ALTER TABLE "ManagerInfo" ADD CONSTRAINT "PK_MANAGERINFO" PRIMARY KEY (
	"mng_id"
);

ALTER TABLE "BookInfo" ADD CONSTRAINT "FK_PubComInfo_BookInfo_1" FOREIGN KEY (
	"pub_id"
)
REFERENCES "PubComInfo" (
	"pub_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "FK_BookInfo_TO_OrderInfo_1" FOREIGN KEY (
	"book_id"
)
REFERENCES "BookInfo" (
	"book_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "FK_CustomerInfo_TO_OrderInfo_1" FOREIGN KEY (
	"cst_id"
)
REFERENCES "CustomerInfo" (
	"cst_id"
);

ALTER TABLE "ManagerInfo" ADD CONSTRAINT "FK_PubComInfo_TO_MngInfo_1" FOREIGN KEY (
	"pub_id"
)
REFERENCES "PublishCompInfo" (
	"pub_id"
);

COMMIT;