Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB6318EE2
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941100; cv=none; b=pP4rkKEj29pSSi7qCkdExaC/QBQPbvUS57Cc2W4OBRDXkaz824u+zM/vIw1Q/4Dcqchd9WcfakUlw52wEPLfioOI2bsD9CWQ2AVGa3WYNhYY9tp0Gxcd75SswStw5Jmfwx0aiaqd3RUEz3Z/78VBpzTZrahh/ZzMJA5afrOBD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941100; c=relaxed/simple;
	bh=zcEDujLPvsRN+GgGPxQ6SWQmTBHbV7jX86seTQ7X3C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2n9uVRnbyQthrPpbhXSs9BsAdCkl+4T8QxdTW1HjEQiLrtYf2o/yBQdgmFdI2yoNfHMalU+lbdS3xaicv4rYEWwD4GMJ4GKrNRnTWz24o7TBEoXumRTPe50P8Ax/ps87QP0EJ9Xxis4SXerJF4JE7MnJ2mRnIFKV3ecULfGpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeL8d2NF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeL8d2NF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab973140bso14751205ad.3
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941098; x=1785545898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=EeL8d2NFpEe1dOCqImGgIwMr4iDUK27buLj+EV4Hcqin0Ou3xEbD0GLeOLW8tRbUnY
         zT/CSNuMGYyVtx2xqSjL0NW23fVB68g8kdZLLYs38vk2n5Afwt/1tibvPB4uXzbIycFS
         fdCHmmbfwPSW0EdB1Xq6ncMTF9FuB/9Fn7FRkRBBymFQ+0ic3ixT6IdlBcVn1/j1Fvvv
         4mlWJHkMNU09h3KzNJafUysHwWtRSOmwbmNrKpIX2kS61yrEBElWVBARbgnMPwUVsSUx
         hoDtOqsEpRYwIxbQ00pE0W1Gv4HO3qr680ICfhZZrF02n6reb54oOQ7Wkhyb3Ji2Viyh
         ZLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941098; x=1785545898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=l5KzIQNK948TLpzXlb4K1qqNZlb0CCHIW07E5lNyNHd2XiqYyHPDOVTESiPke+Q17G
         7zcLjx3Cn7TORexcQZsjOzU2AmUn1uzFo7Y8LoxCvLlm9KmtUFpr20KKHGcLQ1pQ1fpI
         rsSaiSpBAaNRmEiUN55u4lx7eUctSS9CgOfwp3mh6GLWfxXzb7i4W2rT5KaGmmz1mpw4
         TY4V0HuspWgmKCh3LAkk4YODO4NTUXVfFeaGVr8wpiYOcbztEuRNJqT/efrv3Oesebqd
         Cp7xRvRpTe9BzG+3BkyJxb6AXnfBiZHENF7mDaKlv5n29mZodp7UqO44fD5E8Snv+g01
         YbQA==
X-Forwarded-Encrypted: i=1; AHgh+RpLTTkifd4mMTzo7/PwiArqhAnEZOyUDb/VP4IV/PxmpakEy3XPTUc7Wd7PQkjHBrwLCV1yyFFgEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yywvc3rb45EnZYjg/LAYpzOEdn0Ap9twZdRMDvJmpH1yM8eAneR
	usLM/6IGwL9ntxCDKD9g9z1SDz+CjE+npCi52Up1hhqH6bZVNW6MCJWy
X-Gm-Gg: AR+sD13KrhwqZkGiewpYMLikaWJuJIW3Flxp/52mcb7DMlY+oWfCOJuBpxV0Vwq7LxO
	zzc54VwSseWs74K68UgIJjVMu/nE/7LuyJLSEtpCJYD3WjCPTluDbSNGciXwVP+L7vAOFYlXrJ6
	Ef8SwXFymgMO8W7zwQfk06p/lHF+Nx6ar2cFWsNh9Bvd4jD5EHRgfSkU7xa9Uq3xaMXuGX0R0pC
	LdV0ozO/Kjz1EijxqDZ+BTLdGZYWTjUgMoJ3XpkbtIRZ3KQS7o9cItTwMSVU7POxcHa7Pa06FwF
	3dF194pOAWisMqtYAuZ6/SnSrOkcNDRTy0jmybK7Y2EsKL9fOlgbyhwAcd+BPDkjmuIJoJDU62y
	iUuq7uHa7ENkugUQ/10jFPWMqwPtNHEF2Qin2Ohx/7QhW6q9Jtqpmeydx08HHKn/5NCapigGq
X-Received: by 2002:a17:902:c402:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2cfde55bb4amr6478145ad.0.1784941098056;
        Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc68sm2289265ad.2.2026.07.24.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sat, 25 Jul 2026 08:58:03 +0800
Message-ID: <20260725005804.373698-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current phy framework can not reinit the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be readed. Setting
the phy id of board com260 manually so the phy id dectection can
be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..a26b18aabec1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,8 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

