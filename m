Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFBF390215
	for <spacemit@lists.linux.dev>; Wed,  4 Mar 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611681; cv=none; b=LNPvkSRIV6NKrTTzpOUsqbs5fjS+x0idER+tTjVZ8OrSkNiKsFoRvCIT5hK5MQT++YFIOmfckAIdAfdCh0f+gze0i550oHUpWAr4QOEm0vHXSf4yxKKsEtvgBaU8fINkJ3WGV2NLoOSKhLXoMxEWGRjh5t8X71M1lWlmRrgX2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611681; c=relaxed/simple;
	bh=h/CjFdpAJcVREpfZXVwfif/697poNJIUcK2DAAylgDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOPPjwDmMlDBPUKAIEfdWPkqPIYJPo7IWrozx9QyzM7/zCTkzvF5QnKuDV+47nB8bgRfLL1HKTu0TFU5oIXUwFh6cg9E8sEub9IeUCvVzaC4OeenC8l5tLTR9CyuE8xWviANbMDEKzdZiLORpqTufCuhDbVJXiWUo8HivHz7WP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4oGk672; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4oGk672"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2775165a91.1
        for <spacemit@lists.linux.dev>; Wed, 04 Mar 2026 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611679; x=1773216479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=h4oGk672eNKzfmcMrPnEcs28MCs/cXgawOJqxy7gAXMRT0585dR1Dau1IFv+7ZbL3a
         91ieDmLyAKbU4A+Jv7eTJo0xMSn2iFxMPtLBYnmlwrnM1c2j0Q0/GkDH/BytBPrJ1dcn
         KnHOsrvfoUHovF5ssFdMZ5Pn+Zk81e4Yv4LSuOg0SOQOMPr9lndjYFmZbwxv7ugC+Etp
         2Zi9PXgW7HEfuXaY+W8VlboAAjD/hNByUKtysI6h880+1Ljkm2whnkBh4IZ97iKARynF
         ngUe175jpm1wDOGrHJQ11eRJ4fjDg597TN3mWfUEULYtOt9YxNNzPO6E3zs8KI98KTFA
         8YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611679; x=1773216479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=kjdf2Sf/atkXgHFiwYcVSPsn6Yswtf40Zp6iUoQu/DzkwkiAbfwAIRjmu2hRvnL93G
         XjJen159BVQqjeH9aRse8ScHTlvAR/isQxKYlk9eWWmuIxv/QY1KLa/W0oEKdBX5f23Z
         1nLhDbV8VrC/J0/I9YnZZIX7u0K4U463zbZOtFDqO2x38BCVproaeUi033fUslpoQwaz
         BUYMhh68GUKu78G/WDNwlrfYkIz6fY+0pn61v9NV+SHoAhYd7jqoBpxwf8kcrGbgyDar
         eqsyFcIXiR30MJB/OnuiQJ+FMdij4592d5YA4AgCLxwMnqTFEtsEMs/15URmb58yyTEp
         2r2g==
X-Forwarded-Encrypted: i=1; AJvYcCV7Y/7SsX0M70ezWA6od1V/A/AVzFN4yCqStfxGDmkIbIZ2ekuaJBMjcMCMq96eOZlbpiUDFhCVCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHRj1HJgfLrBBP2ZZiq3yfd1T6XAXirUjpRu5iihKRrttDUKwf
	hmo4B8s9ujNyEdJxE0gdJRbKo5c3mU+exPLkbpgGt/keV0lxEnxIsUJd
X-Gm-Gg: ATEYQzxyFyIB3JpU0qLhHQAFzXxK0Zwr6dsC3CBNQ1daOSGrX1Fatb/2H0En2xevl2H
	C0W8wS1GzHZ4dA0k587ujsoV7dx5ZbQ6QltqXOBlZmE/Q8V4ErfxmDeQC72kiOOtwyeVtzyDb/J
	O2kSeykhwkbZ4ks7h2Lv6ndlAAuiLjeA+LlmJZVPlNNkHJNBm3a1cb5Q54vXNWrimFjZobrVmiG
	DjAAuEoaNjy7xgYRH29QZo4y4FPvE9dgbWusem4Up3zvpU4VwFtyg0UYFtvYiuuoB4CcgWmTv9r
	kO88Egoz3bImo5gjy9xYDIuCLnAWGqQzAUy6K3y32hHxc7TzVgWdpA/AelXgKGCb26rfObxOd/+
	ehwI/8lZz39gVkIf3TSGO5gk2WSEkJUQz0VyUhECINBvBFE3xoxQ4ZVdz6moBZEwvg/Nhfz+hm5
	+KdwB37bTDjJq1T991FHj+JYU=
X-Received: by 2002:a17:90b:384f:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-359a6d2687cmr1265093a91.8.1772611679144;
        Wed, 04 Mar 2026 00:07:59 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm15592172a12.3.2026.03.04.00.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:58 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v7 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed,  4 Mar 2026 16:07:19 +0800
Message-ID: <20260304080721.1658224-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
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

