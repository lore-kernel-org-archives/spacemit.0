Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DA2F2604
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585402; cv=none; b=V6C9Jw3tw6+6PN54r3XicfoKbzqc0wnKPmNy3xOq3uQp6QwwFmLrh/jUfZES0O4GMv/fwaTPd7CjleLjTYfJvSvyxbc4OwLaeu3At2aQsjVa4aazTgKKF0v0QAIm9jntXbMuUm3vN1Nz9QoBbFIemQ0mz7cCtIr8b17ef6H7bMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585402; c=relaxed/simple;
	bh=RbmYS+GbmO5r9aIsVbkZb99LO5fpXfIwGvbgj9g6qUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgrgNGhWk5en4OWiAYW8yRtmUtBePDRq+aPlQVRpfEzPIshRXnMM0a4yvixFUyZW+Jx6uUNeMAJBB2lW62h7GqaouqinJk6ZA+S/lJAR0VLaIl/5CAetiU8SBAxKoo/e/P5yka2ilR2b/pS0d1kqGJ1GBJetVVrFYuUfEnOs67E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsjsQcsv; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsjsQcsv"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b1981ca515so7920817eec.1
        for <spacemit@lists.linux.dev>; Tue, 27 Jan 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769585400; x=1770190200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=RsjsQcsv/aBAgkon3eIVCMKLhywXIOPQVZDwVEwOSF5xlMcSSOAAh94zakZuh27cFt
         i2hjecUi7VV1mfpJ/y9CLgwgdHtv9DFJ18rzWW/nnQy8YnWaIIDL+IeI0QeBXvDENxKi
         KpxCRVbZNlVsvF0SAW4DJ+AAmu++sWoxZYipwVvuyKKMS05EH7U1rzinbsI1fOleMhUN
         f1NSwLqvc0qRx7Koj9UBDI86y3jtQiKarITAg1qkVoIQ7wkoUuGUvzjDjj2tE0hmqJ5i
         7BCOS88RYaLJNkjZix4+8jNjLqXHUcgCmMz9RkXt/E6ME0oH742oT2wh1hm/E9QJkURp
         pY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769585400; x=1770190200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=V50QGQasmGPWJp7RB5roGgrqKqmNoI1vQzn5mjgMX1uXfgrb3e/zfcvIkHprE3qX3p
         sd+lhT3ND58y6jedZSudrRC1Yh0IrTDGsjnNcW9Tr1qJtNn+YwJ841UtxwuS0adEpTdA
         B2ogkMcuobV+3aBNH55jb+1EBw/0BaoWSncdtabhX2SwM72dg+gA08VRxR4tn7mthAuz
         qkpJNnPmd7kPjZVDHH5MVe3snEipatLe/tF0VNCs0VFBiGhYfJgkegT/XS1SxjeCAtgD
         BGu0r5iEvp/OvcIhOn19Mtj3kLnashzX4aQivDVnV3rvj6yx0fLz/n5pX5nOQYKqfZvv
         aRAA==
X-Forwarded-Encrypted: i=1; AJvYcCVJlcATsVONdDbPPqjKxuVIfcH9fP3UdQCkdEB4SDXK2E7KSyLSbiC5c7WW331iy+iC/ImtCwTIqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5q2Z1D7gskEulN1Y9R7iC77jGyXaUqhcZk67di1/JR4Hg1RjS
	Gvn/C99Awlsbq5fjjj7C2EBelncu99dWhhhUandRNPz9dULn/Ow4PST7
X-Gm-Gg: AZuq6aLTNsc7E3+UxwKO+LrM9DJWR47MoDnMMXpOwneL1gBRyVaHYuSTSaWDAxt22Zg
	IHDHuNdQyeJposHSxLE73MhLQeWiAw9AtVh5Kl3BgzfMplti1Izp0/HeZMphkV1kizjbP7jHefA
	wlVEV8ru9NlSiulh5LVaRRqPsdpDFXPjBzoKruBzYMYHqFHqvKM2m8mb1uXKDriy3/SWsDhUEzR
	kceIo92jqZYxOvu+6V4EQp/bdW+CZlHpT33VdVLLvJORaq6mVClcwkTE5topIc/rTEVFgMu6W0c
	3WQQtpjoLSWU20eMPaacrK5Op7kvook51ZuoIwgOK2oiZJFriXMGN2gpX48XNyMkhsxp/QiYNo4
	9DF8RT6bNvA9aJAGD5SWQwMk52ClvliJWiYQt4hlRjfnlPNKvUkfJBfFwI+HPsuwvDyNdMv4fx1
	ihqh1f8kF3XQ76QrER4JUI
X-Received: by 2002:a05:7300:cc0e:b0:2ae:60f7:7f42 with SMTP id 5a478bee46e88-2b78d8df584mr2785650eec.11.1769585399859;
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add66fsm1479966eec.28.2026.01.27.23.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 28 Jan 2026 15:29:28 +0800
Message-ID: <20260128072931.875041-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
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
index 8979a50b5507..54c7b1537ab9 100644
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
2.52.0

