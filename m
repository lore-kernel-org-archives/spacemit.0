Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B2318EFF
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 00:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941096; cv=none; b=fkAM4hAwYxONEbkGPHajWNb748svP/EW8++onMyXdibbBUsTScniq/vfI5gBuRmGrGKROpNZBTdkdUwdxVokr2xVLvfrSysYpWniC50U7DvVHXjK+vkERBlqM4EjW4MHhW6I/nMosifaSc75rwwtXaxtRHfJJTMmmMMz9yBi8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941096; c=relaxed/simple;
	bh=qvt1xeKZaGMzjY4GmRnBlOy13neWiePcPbv4luremNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QH/byUyGJjBE1O5NSIGjKm0wOotDrLp12h5EVpsLT3zif3RLShiKwepLcVm2Z/n2s0hQNxbVvTdqd9w6uHroWOy3LcPDJmAqiVCKI96URvS9BToQ3kTmKRhOcbBZ9FtacnItHI0rclNCPSMEVNu+2/F+v7JLFDkTW2aT/Q4NgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNdy+a9s; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNdy+a9s"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cca0c5799eso10389135ad.0
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941094; x=1785545894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJzCpl1A9lMuSv16O58Xsv9A30hSmOZtX21l624BoiU=;
        b=ZNdy+a9sUSyAAWYQ8Xz7bkINZsggXq9LOoA0Irsf0+8vjinqy1xxGhg2WgpzcFmwvf
         vm+DP9/7eNsWW43aATMewFZYfccJVhcgJpTu6zYd/ZDpo07c+c5fj+SzXN9qQMHqd/7i
         1ix5th9qTabsUh3CoTe7yesG6Z/X3l1LiGQ6jeoAj8FHSeB3cwJom7afBaqXdoRIP3xO
         p8OLy53C7mL4M9QcXi7T8wt83qgdNtL4zytElKXpwUQipy9Oc6Jq07mnnY5NGLsDHCBQ
         4d62w0sUsEcS9huQSQlky7atiOlVaylD7FQM7Pn0tn9BXP9rG5XWxJJo4zJmIplgNGNI
         RnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941094; x=1785545894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJzCpl1A9lMuSv16O58Xsv9A30hSmOZtX21l624BoiU=;
        b=HqwTsi6+jBF/7uC8d+j0rNSf7un0MYH2SZj07ivtDDAr7BTAiwopbDKq4Anw0B6xVu
         fXUH7XVRQ/veSu2c7qOWQ6gfmO5fMTXHoF0fujilYkAptxXSUT8FkK75nVN9HYWfIqkj
         8WQu5Vphtz9EPWUDRiv1VE+XfEe8YEPiSFXLJk7nbhraIVpD5NkBYpQot5nXJqyWEiYj
         cKkwToWR6XYe2BUINbGv1AOi3/lgobDEDp+UcoyUObK1apgfWDV5UfuyfwXQKEO4GBiP
         dM9RXncr/SjPJ7ngh2W86j81j9BN7spbAwEAy2oJm3mspPMtPrEjpXCYXYX23A6bKGQ0
         hmNw==
X-Forwarded-Encrypted: i=1; AHgh+RpoXp7uui8fOjiFdu87vHCCyAvlvlLxkHEpCBTpG0y9ofPRFWPriVYONCXk8OQGCwT9Tc0S2odpBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW89kHcdqtmZFf6EJR9pp70zqP7PTCwZ0EuyBHDksYn8MCG5kE
	hirq7uzjvg/M5NFluVLSvbyhNs8MTr/F+bd2FI/Ek051VFEU+Y1zTo6E
X-Gm-Gg: AR+sD11wH5T1nnMotQr/N8Nqdan52nBwEbWObUUbJHPr6+79GLrA3tfCi7/5FthjAap
	cUuZriVZJA7ls3pe0q0P/JfBh7YSfuMFWUPkBcS8WUfey/5AO2tnR7LeDMldbkUfT4QrXdT4nG8
	Fq3htl/Kmr+9VJlZZ4YH+vSmdIwNC+mKhK10hEPHI8pYm1sAchYRA48VPSleDENe7jTkumHFhP/
	BB73i4bEkRpPEuSPZEJD/LxggYcodB2K1KGyWqEkzwCq3qFwkrKTc12yYWOgoJwT7+MadV4XVDA
	3NJbnr9ABhvDee//3nV7SW5aQQyqkwHMkEH2qhUrVvTFtMqwnA0FKFsWQKz0P7vRbgVhJXC0Bs0
	StYsQ99r3zMnfctp0OUR8i2EBDdXOpkq0pvOvPbm6jB5McF7fsFxh/mo/1n36mg==
X-Received: by 2002:a05:6a21:6196:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c67daecd72mr595029637.32.1784941094334;
        Fri, 24 Jul 2026 17:58:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm654002a12.30.2026.07.24.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:14 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
Date: Sat, 25 Jul 2026 08:58:02 +0800
Message-ID: <20260725005804.373698-2-inochiama@gmail.com>
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
the phy id of board pico-itx manually so the phy id dectection can
be skipped.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Reported-by: E Shattow <e@freeshell.de>
Reported-by: Inochi Amaoto <inochiama@gmail.com>
Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b2a7d2d0d3a8..b9d2de878f38 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,8 @@ &eth0 {
 
 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

