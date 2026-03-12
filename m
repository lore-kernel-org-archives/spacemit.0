Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6735CB7C
	for <spacemit@lists.linux.dev>; Thu, 12 Mar 2026 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278610; cv=none; b=WPblh+DeZuBRKT2MnjfwEmmAA/vHvUQsFXhjnREdArFwShURAAlU+nybr+pxPaneso4DEhrhTvh4BRczZLO7Ov6fCO32iDSZHc30iYHcY6PBuphFqfYUULlplzfL4tMIth3kPdhZ9a7eM8kNdFtOuHX8JvIXJag/F08BZgZ3acs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278610; c=relaxed/simple;
	bh=oXR7vTLd0I1RsCDRTzJ+Auh0cCkgfICbXcBBqdH8Z5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a45974OtlXyCU2yMZxHN7+hhvu1m/5ga3xeV2o0iCagGvEIENb5ixlrggyrW1n7DPI9O2NxKvwfJBo/ieAiu+H7fmFUH5pDqWE5UTXjKcq/n3rs/0GVZkNCfgmqHU/DbbRmy2RCTvrK35UV23OQt+A+2IKvQrNd/VQgg5r2xkq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQFuDyfR; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQFuDyfR"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a1c6dd788so8277796d6.0
        for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278606; x=1773883406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=aQFuDyfRkOHwmxUsF9mfkAroZ8Pw5IK63oYq6DKgLr6MDf2UBu766/kANExPytM8Zu
         SPT2yhwHIYFO+efi6kb9BspbrukrN6MxVjyezbXGbvvjfuVLTk/TGa05oHuh3pKXsgzF
         +lbDHjLFAnF9TbqPShcsZf19T/Q6/348TboHxS2FYHZ9Nm6d5F5HBz2wCTEOHm4xS4oJ
         BSGL7DYaYTJT7jLzr+DA1dg+xjjznxkPPJq1bnKKcdlF7cXeePZw+lHXebcBeHyfCbjy
         v4brPpWwbDKHmkydRWDM46TLml0yufWQo9JFGGW93VXdZ+2zFesRQJFx2O4QXjThTJD2
         xj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278606; x=1773883406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=XsteiaDiJjVpBIxIlYceVWgeniLtkRJVlPsuOLTuVpgi0iremzTxO1xgIEn3YS26eI
         oWr75RT+TCIa9QcFt8snldn8kKPISLsrvtGaxuA9Tjtyn9sRQdMuRtT4IKxK8aC3NVKC
         mn24+BQ4DHFtLpc5SVx03q9J4SKCWe+2+q2+UVkBgLQejReMCqymBKCAKCzjTPgLYSeX
         yCnYnnmgOSOy35SEbw7I1pD2uAM28hphraL8JE+D95yoII8f2FRYTl6Q32OLZHx0sVHJ
         +RG0ezmrzQoKB/oTNZ2qQLLwXRe80UxQT2B/oeQmi4TKPKIFW1d95i+kzlLWmYO2GyO8
         48xw==
X-Forwarded-Encrypted: i=1; AJvYcCXz95/XTaXojYWkRN3bqUfwM2tJfVes7gU9iT6E5+yVDbJMfoW22kbzB3wscgBiFBcshC1s9rgfQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh8iCYEaYYF94Xu2yaWIlw4G0VNWdhKxnTSQqkJGbXTHOlV2f6
	418TgymDqkuHdPo8m11BDwxAmLM92mvQjsIrr7Jl09QbUYaqGekmOs9e
X-Gm-Gg: ATEYQzwdhwVQj0mVAd1Xjsh+ThSdrQefNtQfbEcIZplBL6xRws1LBkjXiHzBNspw5IG
	BVeU9oUi7zpjfrvm+nvqIAJ6MKgn15Zbgt6+83LJM1c2eZYS/lFpdCK9Hpfx0yb9TSsLzWHnE9L
	dRS24MOHiiIZDKi4aOmMG9J2ksJb2eZW0Lzrbt4H7OO35Z5Y7kUfY6iMc0asVSdSwO24DCvGrsp
	cd3A8MYaitw6IjTCBDSOr/ik0067dQlhyJcAGuA4Ye1UqmuOoyK5pMDQOhTe4CPDTql6DhkmMd+
	+fX5HQOuchUTihCcw9SzM7x+JQmhQ4wq8x+eIxLn8sz0wuFQSveevPX20Kxg1a3GkC4tj/6P5eP
	ExNSU9Srbr1PaflC4zwuEr08OwQy99IMA3DL2hHPzWNLMN5r4gz45/+5GrzaQElj1rBQG+a+9eg
	yMw5bt1zR0q7gwCzblmUYQNPc=
X-Received: by 2002:ac8:5914:0:b0:509:16a1:2033 with SMTP id d75a77b69052e-50939fc6e51mr61632471cf.26.1773278606210;
        Wed, 11 Mar 2026 18:23:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea244sm23041871cf.16.2026.03.11.18.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Thu, 12 Mar 2026 09:22:24 +0800
Message-ID: <20260312012232.373713-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.53.0

