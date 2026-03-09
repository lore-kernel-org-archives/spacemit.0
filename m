Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED791242D6A
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017028; cv=none; b=p2rAZoeMLA+RiREcspujNW9eJRpS+mEDDDfVV9kJ0nrk4Ej4klQ0y7nvFqkAt7MJzKeXso6rFrB4uPuhgoI/Jos9LjJprc4o3GTX2g+SjTQMCg6cTZs/bs+NEqi8VYBLVuKOjl+YljHeIuRQPmNS2jGp4T8/r0fmmhg1e2wZvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017028; c=relaxed/simple;
	bh=h/CjFdpAJcVREpfZXVwfif/697poNJIUcK2DAAylgDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac5q5iRRA/bUPbYV2Nv/9kWGj4p/f5REsdHoIKh2vQ+wmcaH1l6tk7U6+9DbA7s/bYcc8+FeqKqzRKAcGi7nKJYnil/6bFOmmm2zBKG3lJRigNthOzXJ5RXvhRanqxePScf28fyP/AO7KRghIcwLeaRbohjUSfe5ic8VgJrg7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfT56Gps; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfT56Gps"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824c9da9928so6227914b3a.3
        for <spacemit@lists.linux.dev>; Sun, 08 Mar 2026 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017026; x=1773621826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=PfT56Gps9zVGzyJOzwXwviIqd1Eg4/lrsVL8Z915nwTxINSjt8W1saFcOTrVmXc+3i
         8smqi+PNK180QAxanePMlUv4Bk5jo2fopAfUamnKiZHDnz8qoO6Xso4TUJ0sGsYS4esl
         hxSnz11DgcjiC7pEE6gJGg8y+9JXkgQjPlEKUcY08YFLAh+fJT/tSxpBxzHLoyZuJVK3
         n6PimVtfYAYJiiZwJqV18Fee+4rehJXrKNrZliqFQGUUMGbxwJD4qFWnCF5jtIum/Spx
         y+HXDC661y5yWIi9dgUO9Qs+yeHjfKLHJuB1DSh2fjtXPsubSBwe6oY8e4q7HvnPxikT
         TZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017026; x=1773621826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=m3CKQ/WpZ+I07zXLNFuMncp4OJtfslt3JGOqJeA77dbZLeUCy0O2sN1iOCLly6WzuC
         SLqzLnWe4qAbXTEUUmy7l112x0EWAS8Wdss2n4uEsXIRAONo8YMRwkkd70asvS2T3dcH
         GwSKmfg3IkO0yFWKJ+l59cYZRKsgu3dnyTcaA3+I+HVAVG8WGxizEq9r/PGnJkCW39BC
         dgYXtrDd5VkKBO6fW+khZWMrKeEvFEJ86SXlyctgnTWipYPapR/0v4KPGj0w98bPeDNt
         FlSd9zzQStpdNRtFRwA1Q0o19oDcLFoLbQ/dOyxm+xmm+8K7ZoOENPGHhntrEDrg7rk9
         AeDA==
X-Forwarded-Encrypted: i=1; AJvYcCXqaUJCVDcpGYvgvl9ueE0mZJxaJ/S4zibbP3xYQilcCKnJQ0dcUUP0jjGwI1obd9HPPiqaXf4srg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0LB+uXDUXbiBc2rl8UFoGBoOLPgrVy1+8K7sTIvFBF1YIJ8a
	lvASU9jBVzhsVdrFFwsSZt4aPKB69HY/CWnOEuWO/mVMzAhLRkj/gGIX
X-Gm-Gg: ATEYQzzGoikS2srmtJeM0ILs0rztFI8Cssjk0Bh8CvWJCKZlbyJ9himolOpE1kXsrqM
	51WnHF7z7LXOLDobemaVZoC9j6W3A9TT2Lp8pjGibSD+3FKT8YF57TjcwyHlJUrS/BTI1Rr6XmR
	RStIjv2BAGXL2PzT42pv9R1m0UKRNMl0RB9/z1YDz1iRks8gjk7kzvOWL72ZH0bQJF9zok9FcsP
	t4gDQgPY/cCc+GNuE6elanZQKCGc4BcYwv/FSF+tAYZqbEF4FoavBxN4p45131YkvqET9wvelGF
	Sq9To8JHN3FEZgHltYGp+0s6ELwp2ISn9DWfjEhXUG6eTBRD6VseQgx0F6kwrbbm/bTXZLPPLV2
	5pfsM9+nXO5Uh8HSQVC0vyBjG2wBCXm+1VLbc98RLAldapgCMMthTfew93liXJrX90cY3BIxl0W
	L+9wR2FadKFrerPm57KnHW3lg=
X-Received: by 2002:a05:6a00:1954:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-829a2f348d7mr8883510b3a.34.1773017026266;
        Sun, 08 Mar 2026 17:43:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4656f43sm10324424b3a.16.2026.03.08.17.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:45 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v8 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Mon,  9 Mar 2026 08:42:43 +0800
Message-ID: <20260309004305.315018-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309004305.315018-1-inochiama@gmail.com>
References: <20260309004305.315018-1-inochiama@gmail.com>
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

