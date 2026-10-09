Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9933438F
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565600; cv=fail; b=QLGdeY30X5rrjXGm/oXystw0J3G8oFTSZv709H8mE5hY3D9StLvhwj24Ui3dPUvKb5RDMpGZ435JrhL9MxG32gt3eT6xhOEk2VNsKXuOBfCLno+4p57KDIhEZAta91SYCJ9h24CrkgNTjnWbD2mnCxYncfKhSCSsIUU1uJ+FTfs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565600; c=relaxed/simple;
	bh=m908roCxbPsGbmvRCcPeiFnqw7kwGwmB1M27wJsPFn8=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WY0+wBM+B/MKKqDvFuVOFFx6SrGfrbqOYGtTedvSGFtoellks5dd08tDa7kugx58X82WcjS9kv4JjsSYj7IEXGc6GAJ1xqnPI7NqD0xcgh/B7WcBsvX1jCzvbhErRQnzR8XbPAgKnY5vrxMFbrhXywetbZaqbY1RD1JQ8qPIFCQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VJWyjeFg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VJWyjeFg; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VJWyjeFg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VJWyjeFg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O7tkHZpH0yPt/5odcjN5CMGyhYn+FCsVi8kbhTtYqN0Uv/1JI/LivRjwwu+6gmg855gBSwC5oMWAlSHGosnxPynccPCgjzgljiF9hTpOFBj9nQhLYFu4Gpa2CjFpA/VrsgeOQyjmITzlw2BNl3uN+IHD1xqszEC8LnTpFjzYwXP+gX2VLNg5yWyDhWSX5rFLFIvf1ZSqrBBnOyF77TuxRKu6jurq3DGale2yVOJfgfmvhBQIDuCM2B69HtU630qO9KKwaCptf/dsjyqDW7Gryj3ohSvhbhhE/9WpwjRNKS/sM5IRZOoL/bc1kZxsHOQX70s0NjF6dFJEwurLMpO43w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOSY3SoVZmTUeWiSvjUfVmEaMmSSadRZ3sceDMPkjJU=;
 b=bAY+RyFcGvrsomrvHSJQSQgJsLo9O3sJ0My8BFYnIcdehIKH9ZS+ujZhJImGmSfmH19NsIXU7QaKnVsqX+OTjS1eLPSxC0pvdx0BMNVJr7JDN2VFTtwovRPi11P1g53J4Qz67SOoO/qAW6XGbSCdjqa20A/aN03DsLL/gaoPss7UcWxvKvuJYn1MyitbwUS/tdD+JEUcF0S2zsa7wgw1/IDNGrsgdrFk7ocZLeIOx3X+n2zVsJ/5rA9MWcASSR5Yw5RhIMbx8N52+WvkPAFNxnIaOdeEVRVXpHkEcQw/sKhHmB+hqZ2A6dhuVVvPw5FEHlpowWpnx+WJVL453XvMaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.u-boot-project.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=pass (signature was verified) header.d=arm.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com]
 dkim=[1,1,header.d=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOSY3SoVZmTUeWiSvjUfVmEaMmSSadRZ3sceDMPkjJU=;
 b=VJWyjeFgzChbBbB4no+LGUefxEgwWnMXDWL7d6/L1FjiIuG0bHwl8K4F/ECfPo8FEAfMsAzvjCO0uyVvgY9afiMlceq7e82jyciqvRv64V7knpXD9MzZSDCvH7Qgmtn56+ES6fBKUtZDVVnLwJhTYFoB2bwVOdpMmLYl1FYwPzA=
Received: from GV3P280CA0076.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::35) by
 PAWPR08MB10091.eurprd08.prod.outlook.com (2603:10a6:102:366::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 17:06:30 +0000
Received: from WA1PEPF000099CE.eurprd04.prod.outlook.com
 (2603:10a6:150:a:cafe::34) by GV3P280CA0076.outlook.office365.com
 (2603:10a6:150:a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 17:06:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF000099CE.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 9 Oct 2026 17:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+lrxE0QnwaF+fsQ8WOgYTPkE5iYydPmQBCQiruoCXlnzsYsm7pnDQXjf+I6yyiy2yL40qvIcFV4Fy2zP3fWDG8mS7w9Psvl3/mDGuxBqHz12U675ga7sjmMVm2xj8p6xbAJsIKtjNwEUcdxg4IHDZlhcTid4mXxnkdsQRAGk1nfJGdnVcnEKSXT8nNVlprUEmA4Mdq37ed5ALyDy636HSC19pDNHd6DBN5DEPmNgAOUy8TfrmaF0CeIMoAp+yUaBlswUMY881lZxPwGcz1OicFTtXKYrZQnLkT0/4HBAuU/cDR5NfZC+ULZyzV1/FGmK2EWLXvcWe1c+TVWYs8kqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOSY3SoVZmTUeWiSvjUfVmEaMmSSadRZ3sceDMPkjJU=;
 b=v2BzMqhNijIxdRVLOaWazopZMNlhthnlPox9PK244l5G5guoxEXbd9T9PrMeQiRq4a3LpKBOgnMzslRHLm+6eMkCcO0G5+enl6mOqhGS1RHvSbhbUHAp+U2FFLRz6jgjRjbXU+nWNLI8pVHJF0kzmgMO1zUufU+K9sqBFmNdDmByndDBEyh7fhzzv2DKxvM0LbtTF4XRUviB7Zm5rWuPuD73yxgacKJE71L8w6U6r1srzAIFoan7rVqI+ZhckLslOnwUcX8BbR6z1QS+H9X1MsZNuUck6I4UhFEJU9H+LVCq9jV2UKWJMTorMSeJ0PyROgZAkZx8GelKTVX9dU4TEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOSY3SoVZmTUeWiSvjUfVmEaMmSSadRZ3sceDMPkjJU=;
 b=VJWyjeFgzChbBbB4no+LGUefxEgwWnMXDWL7d6/L1FjiIuG0bHwl8K4F/ECfPo8FEAfMsAzvjCO0uyVvgY9afiMlceq7e82jyciqvRv64V7knpXD9MzZSDCvH7Qgmtn56+ES6fBKUtZDVVnLwJhTYFoB2bwVOdpMmLYl1FYwPzA=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11733.eurprd08.prod.outlook.com
 (2603:10a6:20b:740::16) by VE1PR08MB5822.eurprd08.prod.outlook.com
 (2603:10a6:800:1a7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Fri, 9 Oct
 2026 17:05:56 +0000
Received: from AM0PR08MB11733.eurprd08.prod.outlook.com
 ([fe80::29d7:e9ba:ff69:a0c3]) by AM0PR08MB11733.eurprd08.prod.outlook.com
 ([fe80::29d7:e9ba:ff69:a0c3%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 17:05:56 +0000
Message-ID: <c72e396f-7c4c-4f55-a413-a0653d21f8c3@arm.com>
Date: Fri, 9 Oct 2026 19:05:55 +0200
User-Agent: Mozilla Thunderbird
From: Jerome Forissier <jerome.forissier@arm.com>
Subject: Re: [PATCH 1/2] net: dwc_eth_qos: spacemit: add support for K3 SoC
To: u-boot@lists.u-boot-project.org, Yixun Lan <dlan@kernel.org>
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Robinson <pbrobinson@gmail.com>, Johan Jonker <jbx6244@gmail.com>,
 Julien Stephan <jstephan@baylibre.com>, David Lechner
 <dlechner@baylibre.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev,
 nd <nd@arm.com>
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
 <20260924-02-k3-ethernet-support-v1-1-b8e1fafc9249@kernel.org>
Content-Language: en-US
In-Reply-To: <20260924-02-k3-ethernet-support-v1-1-b8e1fafc9249@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::7) To AM0PR08MB11733.eurprd08.prod.outlook.com
 (2603:10a6:20b:740::16)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB11733:EE_|VE1PR08MB5822:EE_|WA1PEPF000099CE:EE_|PAWPR08MB10091:EE_
X-MS-Office365-Filtering-Correlation-Id: ef899f0d-24af-4f63-4cea-08df2627a8e5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 NbUlAju1WvscnimFC9sFOhOX+wZY4ehxmNFSFGr96iR3CWbs3r327kmchLLD02cbbz7IOlqZ8HsL0LoluhzJmgmcHcZlYvYA6UFz9X1Jr6TDMwORx7nnADM+6xj+/gehB1o0W/pfDqjjJV2lXkTco4zOHdg8XguHvDoC2JkAP4KuT0Eja0iGl6Wz3C/GZ5sD96k+BI2UgxwJqV+LItELZ4+6sSJvDBW+Vl1J5dd8gjVFwAWiyPE3xK2MTTGjgAhcoRwBmMwZF7Bgh9ngG94klxnwdjtWOWCx0Rg048oYnyo3Z0LfJ6OYVzUeDfGDPCI0WTM62c77H7tVTVZbYck2j1599SQ4UYGhq+OnasFzq0YiLdGkw29DzN4xTU7BIrnzWHm+44Nud8SLmZyKgoEKzBBkj7hKxzG/2AYp8s3SdK3Co+4fLN+pT2+kIyoXQuXlhCXg+wu9GA4TnfCWQ+ENW+iQ+vZLm91DEDLTMTP3MOZfNVNZV2omdJRMt5eOXd9Sy1QlfvC68pjHUsu67pMd7JR6WNtTrn6kjrC3U8K8tO3oOcmQ4RF0omk2jyXl09tCIZF4lTz8TnlwDN279LSW82rCEdrlJjVn4HZz53bzmrua6jB0xCf8/oX9R9xCqkn5+7V+Yg/WfinknSVqK08C1MG6Ovd2six71mpgxgZT+NA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11733.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Bs9ZYob/ZZA8vCeekKXB6EiO5cTXZ51hh9BEP/tRj8Fxxh/UqyOGCz6ikTmGWMpMuy+W2mk+Y9oqX4ysGFSguyPsNfHjU6jmS33YVHd6qbhfUkI2YP6neN3b17nohMlNjFEILSP4e4nkdEU4FIgEUTUnG5bQaK2ylDbzniYYLwCLPVFv4sT4oc763SmG/vdG/mjEeYa3oPQz2EHoY6PGRJPQNoWk93K+JTlwRmqcr0OEqYsOIZeTqD9SfA39MSmAZSl+G9Pr6D892tSNh8vvNoul+Trv3hi+MPybwZ6if5x3Zwqi6YQFKU//5LlSKNbehZru7LL47dUDNmTFEofS2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5822
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f45f900b-4b6a-4b2f-3058-08df26279571
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|35042699022|23010399003|36860700016|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	RtmAbgHHQp1tDChm5Ew+OIhU5V2LmBUJ4jCNdv00Apks1ZgAsovI4JlovKNN6qjpftRacVvgS81NstDmJh2Etyu5NmCVFNltdeRFHjDodLOvIbg6ECTAPs03To4locXlbW7cOdlL1dSVILR/sKsrGJWmWfzLrq1trjPL/Q3UCM6INNrk7LLyD/I6BcH76Ao6tYVRT8CTq54VNnto32XjwxofcE9iWCGjJwI/oZAxJ6YlJeCcPGvxXiCsV1WAITNkdChGNofkuIRkxkD993m4B5wUsV/ZWXaE2twSW/25czNeNY1XOHPKYedisW5e/I0hq8NTi8Wc1ZQeyd2TOUFy+1iwiY7kROrw5IlqVmp/dyt1CycEK2EjejDUtILEa2GAStXEhyLgjApM1fidfZ1iTpV16A1E9rTLGZ9Y8YyLKFdL4Yrt8x30K7U7GMdiWmQrh+4bhWG1F10VUop7Obm+xOOZ2xqVJR3iGSPU96zuASULTa0C/pQwzQQ6m+YspL3hZX1tLa6KHboc2dl5phtM+NDP1py+QS2fkWrZmqousdlOOckxqFNrA/X1YsJmZlurLLlXhF5HeLGUSt8DmIiQAxR4h+GbgA5lrqEdlBF0Gy3wspycaDtPd4EUoeHj7wH4LhZpPauZZ2feeP/8fMYrr0g6GNsh+3lvy5YRpRhAb2ZUr8hRo3YUSlGd2LWN90KYjLZ1xPY2Y+wL46kvJHZ/jQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(35042699022)(23010399003)(36860700016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ULrD4I1HWz95ORpHECqiuNDoCnLlNxiK92TNsYbLhSpyGb3RtZ0EUEauehjLGdGCf/nj3iGKTvcoNhB+EYlRuKILx8uIb+5aVnGi3owkSRZ02LXxsub73OII9eLwmcQ/20lvoQNnjCB8fAitiYzbe5GtpOo6PVhU+2qhgz3Fo3nTKfEreodWiwsSVnGMJwXwW9Y+YqbcQri3fBxu1mMLtPf2b0f6Nv1ZvrrVR2KLmMymlDqDtNzAw75wJJJJ8RC1PqkDGEuKLixxZAadEnxCxOfdSil9NRYX1+p7llSErGg95k0DzCRUde0WRBC03Eq+5krvpr6ic+x8Nz0NYw4RDitMLF+J7Gluw/7EuGFrWmN4Lo4M7WHEjv0mh7zi/DhWhq0zhWlaDh6dln9YqUNOMWCL/MgLkMGl0A8yqAdUGlp2oBWIKDs8z3cJFtAxybgZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 17:06:28.7286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef899f0d-24af-4f63-4cea-08df2627a8e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10091

On Thu, 24 Sep 2026 01:53:29 +0000, Yixun Lan wrote:
> The SpacemiT K3 integrates a Synopsys DWMAC 5.40a Ethernet controller.
> Add the platform glue for selecting the MII, RMII or RGMII interface,
> configuring the internal RGMII delay lines through the APMU, and
> managing the controller clocks and reset.
> 
> 

Applied to u-boot-net branch for-next, thanks!

[1/2] net: dwc_eth_qos: spacemit: add support for K3 SoC
      commit: 28ddd369e2f7199539cdefe22ce014c592b890bd

Best regards,
-- 
Jerome Forissier <jerome.forissier@arm.com>

