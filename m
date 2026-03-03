Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E61A7264
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500036; cv=none; b=PviwF3s5byB2q2UqcK3NSRRUQwHrydAecU4fpEBVLHjEgqY5rwfq+RitbbyP+fK9qmUlaGB/jYOzeO2ONMasS6EYuEzrDZctll3DEU78hvekXitO2cTdsnKfNa6sTZ1VWi/123ONzANf/TqpcArVqDCOFAmVUR3nhqP5Da7uzGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500036; c=relaxed/simple;
	bh=h/CjFdpAJcVREpfZXVwfif/697poNJIUcK2DAAylgDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBJT3MVcX3IrdOMe9mESGtPAy+wykjpSIhMfiRJeL95N6RS5e2iOttKDjwsvzVG39dDK4S+RuQSDfYsFM9wfEeYHlzNOJxEXK05M3zY7kBcImjUMCpqVQo/DHvXLXFpLrO/+3FMZh0gee48FQuC/lm3/o8mBvIOf/sywnwaqiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9tuj8Dn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9tuj8Dn"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824b32875e7so2413089b3a.3
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 17:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500034; x=1773104834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=U9tuj8DnIOO+T4yeLdrI3YkSzIt+0HpLbxLHI+NhVGWY79gYv7HXL0o/CvGWDPISNF
         trgKVJ3wzY/ZDkf9ztIpOP9moSu8LBfJDRDNRegTvXNAn9+cORYlW01hGiw6BvZXE7bU
         E/OQueshQv0nvPOFxjohDMyO4Go1Da60jSlaaSV3PhsE03wIAUshY8Q7r1ytZlCp0T2f
         Xde2PBaM1td/vAfCVK+ErfT1aps6jKOJS0PLE78Ds1aAZ1wYZ3xC354228E1gMTr8VKL
         vBrvSk4KfZiyWoVg1dHKBrM+aOHvjykfOggBCTlrumBWemqYEKxl8ejtVGGYUtjEFBLT
         g7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500034; x=1773104834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=jlflmqEkLI0UNQ0B/ReUZTDETqtq1cTHDza6kSVREBUSBuY06HI6Ro0HJ9qKc6pg7r
         33Gei1ksW7yqbSoh/ak4B7PJWOwho2u/iXpEIuEJOAzl4wbJX+cT3p/XCOsYLvXks7Dc
         QCc1TR0JQiknX9V5G+E4C81rFp6UgHKTwhWNbXFqN8hhtOio96p6V0t9MYRUsrukpIop
         l5pLoe+xpRgm8bYO+pQNh2YjhpxYT4ExbNiJh+KZhB0MtQUCcWAOjOsWjCCrtOM1AmtP
         vBYx9B2nyp3ucOTZC8woQ4SuABd/qAaWqvIcGEDO+HnGFFTDowAx4pjGdbS4UebQyjAy
         vkCw==
X-Forwarded-Encrypted: i=1; AJvYcCURvK5U1c3bXuOk6smTDxurAIsJIXt2gD1Nrjt0j4C9PCi4Q9eFuqkvYyM/ji8c4bA7+GWeFclIqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXDRocKmRV1X7C0ukIMjpvMeKh122V/HxUemvG6cVTB4rHrOiq
	bu+RTChoxK6s5AAUjG0eZjwSWKASHRNvBfeY79/7q+o+nXVyTYZw6U6M
X-Gm-Gg: ATEYQzxI+IcAiq5mwr87xUELDxZZvBxnzW6CT7AuaJwzJvICYUc7WvuOwkM5271ErDq
	nu/cHq9ujbvoc68jXrMG0gVQcHMDSgjNa3VtyYn/wRr1EWZUKen3ulo0cZL83QPZoRjOKBSF+pU
	SUf2TAVreM5TlAMAnpKiuGj6l/rLM3iWAXJjamprZoQ0OoZSzSbP4M3PoNnGUMJebafRvvDOloL
	NfUCRQhkoN2Npp8YkTSLKVUk5yLs1kPB2YktotUZfC/ZD7HG057HxZ1SSb6h6LNZoKXUwrjoprA
	FZCQ6sqW2exFEkFwRtxt4Fz0fAtQKLjTB0n5XaNiGmtYLlWpLlNZ6xlwuq0auRLamvtHTuZUn2n
	SaI8xxg6RkO/qOX+diZk+ANHVbVcaC14gZV21A5PsZo2W7siD+31WfGDR6Kt6YzdLa6m7XwFf/1
	0hCVLsBqxdKoToN94Q3vpkwg==
X-Received: by 2002:a05:6a21:170b:b0:35f:b243:46cb with SMTP id adf61e73a8af0-395c3a1a5f3mr14011142637.12.1772500034381;
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ef857sm12435059a12.7.2026.03.02.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Subject: [PATCH net-next v6 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue,  3 Mar 2026 09:06:28 +0800
Message-ID: <20260303010630.567674-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303010630.567674-1-inochiama@gmail.com>
References: <20260303010630.567674-1-inochiama@gmail.com>
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

