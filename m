Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F237E5EC
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535625; cv=fail; b=t2i6LFlFGcPdbF/vGm4Oh6zWfqUdnbwaC52vc+gVu9vsCNknR0c54PuM134EtXEyiFPTicBeV12FxEJmskLjasqo2cB4tIN2IKAZq+l5WA+kaNq5yTEh5QJMFVzCaKG94ojvl1Gx/BfFi8P9pdCG2ojvCklYACcv3GYWaV/1Yzs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535625; c=relaxed/simple;
	bh=iLNNY4aWQL/WAfQkqLppw5Ix8k81+zcdnIlFBVF36Yg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vAVG4NM4O6FNeCcXLYOZk1usrcL4OTpfYpWvuDHKfFwk+UKz3xDPxNmqsXc42ufzCKXeCXvIO9OHwhdqcjvioL1P/sUNwVYiKAV42ErZUhNl5neIWLCNBQgr5JUnTBe1KVbUqzCKUMP5y9t1pTYDGSw/5FMFRX5IMr7kqjNDV4Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q3P7Ae97; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q3P7Ae97; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q3P7Ae97";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q3P7Ae97"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sTqZLBmmTpnHxdEUI79rKwXI2hWkg3uP4j3++vseUKa3wm/B1KQOTxekU6/TmfQDaINBqNMxOpyT7Q5MoJNzv+LphwexVQyrjVSyo4G5bPavzpswW82JxIS4CkA4/vGajp62GQfo8S/Ws7UCweuxh+xPhFZpaRSAZNZ4Ov+Ykl52FRCQwkyD0yvx2TrMsdKGjcaNcS3qpvrN9RhyeSgkZlQhhHZ9MnF95L37fxCZWhmDZ6/StyLk6o8oWZiDTpS4npvebhypAE2yqJ85UGnBQBFGekHUP2b13C0NYCirNgQCn+hjX05e42h6F6w2F5fo4EnMf1dFONh0zLHysp8NqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwUoppLoqySGQeSEQiG5yB+PbQOpHYnTKT7aF3wMv54=;
 b=UgQR5lGlD+qrIuwm0nCLp5e/PhY3MewiubF7UXzc/xd/ImesPpvQ5YqGYGNU3Ewf/M5YiBYBMFpKpg+gFjiwQIsRgQX1GIEQCnaKYc8b+7tv4oAiqBEcFvhK/lxYbF7Gb1KKP3ATJd3uMFQMFh1OxZhqVCbqmVTCOY6gS+VHQGp6jZQ6QAHbweJSCXBoeq9XjaXYJKNIrVlbGESvu+2jYH9zYFhrnL+KF1xsnE7pokOSt6qIeLk7kketa6+JzDHVTOwK+QJ4xN8B1G9BuxtwFHvKsGYXh5VMfJjhteACvVSpnlauuZ3R7WihZb99MvRSuIgY2FVNwyzsEvg1yLshnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwUoppLoqySGQeSEQiG5yB+PbQOpHYnTKT7aF3wMv54=;
 b=Q3P7Ae97gdzCbkVvUHiIdbF86tJh7g2Gb6pGaUqmG0cf629ZyWgS3RZ9DEAanaR+mViJaN5qPyk02qPGID7WVcSsdD4pcMZt+mEyTso3Tj+KrfD7wZ+RaRePUOJv8fJm4hm521AzYCQ5NXcwIUbtgOokIzR5r8fdNFDxm9uJt5o=
Received: from FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b3::10)
 by DU5PR08MB10399.eurprd08.prod.outlook.com (2603:10a6:10:520::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 08:46:53 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:d10:b3:cafe::87) by FR0P281CA0156.outlook.office365.com
 (2603:10a6:d10:b3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 9
 Oct 2026 08:46:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 9 Oct 2026 08:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oej35kHGs8eybLNU1v/AnCiG9Va10/U40qxUSD/6En7BcDLs3GcM4pHv+LvAhwtgwpSTtxk0S6p5Ak1jid4Cap4ExGOkk5QpbY3508BR1qqr5o6OzkVv7F2Zao5Qvf737NO9dEY9+9U8WfjK+YEGkndi9vdfehtv0HesmwJl5ogQcZ2pkndS3bz/nbJoxVzwBFcwegj5sTJy6pMce07mbtlSa6z2cldIBQtKpAE2f62f88qzRxHFwtdN7jbNq/v351nRx9Az89scUdqpRisqKcn2Of42Ka2mC99806nJxJZsluJBWgU424BpkL2rddv903H5eoLm/Swo5nCoD777JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwUoppLoqySGQeSEQiG5yB+PbQOpHYnTKT7aF3wMv54=;
 b=lZFlyUP+gpCCDyg5LL2TOXZBcLWxJlvwc3lkkBLL03ayK0lRAJyeQSKdOUFZ4i35FwDNNzp0ZY8yZHGUZ73JSAmC/4iXnF7Zrx3y41DlsM8egun2oj4imAK6WSTktnhcFOoM4K5Lem1k+PztbWof9AFzd3FyBfROyEiyJyW34bbkckayeuNmlvGutl0+LB962sFudRBRqQnmVA+aGhuGm1DlUnTFgn1rKUbgYGXBG8Re2F9+PXGW1LYtP+t7Jxxh9PiFukY/razxlgGvDHzC2FT8uqudS4E3HYttEOM4L/Td5qgblNYUY6EWmQXqgk1f+Tn/PYy2Eb1YQFVsoun+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwUoppLoqySGQeSEQiG5yB+PbQOpHYnTKT7aF3wMv54=;
 b=Q3P7Ae97gdzCbkVvUHiIdbF86tJh7g2Gb6pGaUqmG0cf629ZyWgS3RZ9DEAanaR+mViJaN5qPyk02qPGID7WVcSsdD4pcMZt+mEyTso3Tj+KrfD7wZ+RaRePUOJv8fJm4hm521AzYCQ5NXcwIUbtgOokIzR5r8fdNFDxm9uJt5o=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11733.eurprd08.prod.outlook.com
 (2603:10a6:20b:740::16) by VI1PR08MB10104.eurprd08.prod.outlook.com
 (2603:10a6:800:1bc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Fri, 9 Oct 2026
 08:46:16 +0000
Received: from AM0PR08MB11733.eurprd08.prod.outlook.com
 ([fe80::29d7:e9ba:ff69:a0c3]) by AM0PR08MB11733.eurprd08.prod.outlook.com
 ([fe80::29d7:e9ba:ff69:a0c3%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 08:46:16 +0000
Message-ID: <6f065a4f-d71b-445c-b0ab-4061cdeb9c0a@arm.com>
Date: Fri, 9 Oct 2026 10:46:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: dwc_eth_qos: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Robinson <pbrobinson@gmail.com>, Johan Jonker <jbx6244@gmail.com>,
 Julien Stephan <jstephan@baylibre.com>, David Lechner
 <dlechner@baylibre.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev,
 u-boot@lists.u-boot-project.org, nd <nd@arm.com>, E Shattow <e@freeshell.de>
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
 <20260924-02-k3-ethernet-support-v1-1-b8e1fafc9249@kernel.org>
 <20261009070324-GKF2005@kernel.org>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@arm.com>
In-Reply-To: <20261009070324-GKF2005@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::8) To AM0PR08MB11733.eurprd08.prod.outlook.com
 (2603:10a6:20b:740::16)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB11733:EE_|VI1PR08MB10104:EE_|ZR1PEPF0000E6B6:EE_|DU5PR08MB10399:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a44847-8a04-47f4-429c-08df25e1dda9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|56012099006|11063799006|4143699003|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 5GFVq4QCkto7zPPhNmcF3roNalrQRfe3A0uBGL/3Rf2icK1zRqAA0+AeiQ4lGPnQ5KwzmamkoFMdoCnVnrjxzSjv9re87cKxrW4YGn4pto4lNb5MF9aA5BRWQ/UKZjj7JsOgjgZlPdH+o6uSp7dPNCiAX9rmOVX/iUn0lQYV0MzJOOwES7k9v04rK45tW1WJFg7OsPjyMvu/0eVbrt91RxmugcbkGkacMn+3hEWpp4cJ6c+F1GShXMvjgIfyltVkY4dyQxbFtYwilrubdtoTo0W9jFkw//qMjaS2IqD0K3ofrFf3b9CtHQ/kiE6lNTFOOqPqOWy17uvK84GiqT/Olu8VRY3aDx4GhnrLNUkDQaIq/26JjmTC9+Yj7zFSctYL0FJWyNLuwWhO6Ihfs99888QTnPhB/6d+hAs6hyaVLgDhlMUW1lq84jL/MRyAcS4G2odPioOGFbO0Ilowz4HbGWhjdc3rKGXCYPiN19VMbpjjEw+QnH6NoN2dpcsgYD5bHDQbRDb/ZoauI1rCWR/5Ov462aZZDGojvNn/sxgPosoFfpXnwxDXSYzWSIV5mXuGeTyJPjxTX7cQMaKrCjZ7rQ1IEaj9qP9yBhJZ6ohPaonjD7JJNmuAZiwSg4oAxhk9csMP/ZhJw8lltgNCRpbTTgsKBkuER6JUYxUS8DCZX7g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11733.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 qkCQZ86Ta7x1A06vsrfTfwKOO32DKa+6c7s1dYBfXtv45XoS2cXp0AcERqlKPNmk9wraatbzhgTu2sf9Hq3LUZoGzDDTUxVBqIamYKML0cZ/Y4WFY6riEhGQbGa4H5LRpkgj4ssoXh3uMSrIJF1Y9aAxZrQJN8P2bR5SuiH+3kkT+tYXh8pEPpg6rLFNLez6V6rXY/ys18cK0tYHxd3e5NXyY32UrWxVd7x8adTVPh/oyDjrqmTNuCWF9CljmdRgi1Wo6OLe67SevFEup8BoOs01cIeFIFvGwl9l3x18WVFMlYa/xyQtk75g8uuA+odYCMhFJVz3X2/y3bCcC0bcLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10104
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c9e8817-b2df-4566-9845-08df25e1c7f2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|1800799024|82310400026|376014|7416014|35042699022|36860700016|10067099003|56012099006|4143699003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ksTOnEQ2YoZCVvmBpNez+H7U3LUMiEtN0s1lbQxzgvsX5iUSIjJFcLSAfd0wUNWo0wmq8zYn1uzbRmi87L5yUiIqbI4/XUBqsCb5i0/x9TAj4Hy4OOHxr4wYkI9NyfLCWIHoephlEojsUANZHmxDcTPsPjq+GmFR37YRwG4A+9od7/+lhSfWv969hVP345gRNCy55tqxjMBHELnxHMFy4VVaWenHBIyehuNfSbU+lz8f9LspaUsmUPWwEz8rTwnkbg7CRRSjMnUjooLzqdyX8osWCK0prDa4W+q6Gf2Hs9peHSI6uOIdf2ILKiB9hYo5J1RHxuK0gKG5RhZMZsO7sTmKwYqUN1yLbVygdbhYv/22rD2fbk+mbNGw6AgflP3Jv3GVxSyW0wyjEc1NN6xI5iyylki3cJSABCbK4MJeajwN3zccx+nUA+/G8mnypI006Iw1eh8k+C9u5O5VDzhyt2jyBy/urVsTtJo4+zDSJnYkUuZbpdfglFoOaj01bCTH7ChU2+Z3K8F0S23qAu14xYCgh3O4mG89+5762zoGYifjp5wwaC7uMP3uHN9yeLmd4zQgqTqmvY0V2pKMacwmMPYR6DZH42ficT0DI/nRdTvYL0WEi/lu6JRb0lHWTy1iTvxmkGZeoenk+Ar3dfvqmtCYp8/A32qx5SzKuMYQGm9b5jgHjMNhUiN9UA1sXRGH3NWT3TXhw1eHI49IFIbWnw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(1800799024)(82310400026)(376014)(7416014)(35042699022)(36860700016)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	erq1iijy5fPzh197c333rq9+Wv7do1cijbYotzct8q+0hjJTejC6vz4Pp8IL0nH66HQ9fgbzhZGTV84LPJKQF1874hz5MYnofFVkMoWQ24ieQ9yaHvsvbfSRw/h/YGoCL3abW5vQEnqBAKozc0O7Y17ypAK5zdDnVlqPq37ZZymBvx9kB8GvVzR4wkYB+Nld0jE36s9Ett6nMeS5PTpJ7H0NGoBI4z/h0da0Xaf/eJj4fUiyQRkXjoBnA0J2D+9z0PJYgVr6GexQYockp7Ml7R0el8QMaLSv7OGJCSxXJow9Tmnd3xyKKStT5KC3CFXvFoJMFzcPLMyQ78WgJYCM0/AlmuXTH5Vgb4kluZ/VrpSE9LJQF5zjv5/4SUoRXtzEx1tZgm3SXFFSplpeFHjguKvhsAGBw7H23A24TWXAkB/VWnbSnXtMMaSCTkqvMsDq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:46:52.5089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a44847-8a04-47f4-429c-08df25e1dda9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10399

Hi Yixun,

On 09/10/2026 09:03, Yixun Lan wrote:
> Hi Jerome Forissier,
> 
> On 01:53 Thu 24 Sep     , Yixun Lan wrote:
>> The SpacemiT K3 integrates a Synopsys DWMAC 5.40a Ethernet controller.
>> Add the platform glue for selecting the MII, RMII or RGMII interface,
>> configuring the internal RGMII delay lines through the APMU, and
>> managing the controller clocks and reset.
>>
>> Signed-off-by: Yixun Lan <dlan@kernel.org>
>> ---
>>  drivers/net/Kconfig                |   8 +
>>  drivers/net/Makefile               |   1 +
>>  drivers/net/dwc_eth_qos.c          |   6 +
>>  drivers/net/dwc_eth_qos.h          |   1 +
>>  drivers/net/dwc_eth_qos_spacemit.c | 313 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 329 insertions(+)
>>
> 
> Ping for this..
> 
> Would you have some time to take a look at this patch?
> and let me know if you want to take it via net tree?
> 

I'll take this one via my tree. Please rework the Kconfig changes ([2/2]) as
requested by E.

Thanks,
-- 
Jerome
