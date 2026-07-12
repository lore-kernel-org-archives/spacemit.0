Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550121CA13
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783832004; cv=none; b=qBZOAEEBqOR/q6LaEU6q6UCbMw9AA71AGKlcUJCR/HLSeo7atIqpGLjYZzdrhEosHThZXPFzZF612nmn6IIqPYKq5Y6Cl+JQ4uDuVhsQl/GM6NF2K+pQAOfq0DbbF+YJ7tO9AhMUCnnn5yo2jcJaU25R+41btKp/p/m+ah0mAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783832004; c=relaxed/simple;
	bh=shhBzf8yexRu7jj90QvU8W+4YZ4WazeRu+Yf64bVNvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lsEvBRoR/sMcCQrw1y1sxYSyjfvMGehpmhSJzNMe2h71y0imsfruPZLW7BbzLRi9T4IBSkVgWuq/Es35n9E/IwNgtHzTcEhNz6vzek4SFlVEUeJ94YlVqycxJjFv/LNJ8o/SWJLh2ZZbipWvq99F2opD4G24eudS/IVk86Gr0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuvFA5P0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuvFA5P0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cca24023edso25867075ad.1
        for <spacemit@lists.linux.dev>; Sat, 11 Jul 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783832003; x=1784436803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
        b=kuvFA5P0faxvxzsE4bQvGn0j4jDa9ZdNJVPXbyw1yzQCM88ZfKg3XyECRwGVQ4bNH1
         ucrbNl59is9ZQrxap9KISx9ktOmsaHweP0AIqC8UMYlk7+VcTQjv7vFyjy1vPTpIJ3BO
         EvACHgBKhBaWfakbXTzAFl/3yeFlXS1mzPwHUhfdFKwfddNvlH3OfhGmQURpU7FJD01Y
         K9K01itJM10/B5b5m4swdQskIxCE2y+Z2s1RmzmP1BWDcfuuMUVCS/7f9Tu3obdf8Hdy
         drNM7eYHEnlgr+IOO7h6yFTQdaQtwSygr4+PQzqXpMhqN8q20nWsWpXXDa2Pq90V0dP5
         Dm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783832003; x=1784436803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
        b=cIcNb4p2svCaaaq3D3zbXAthcXR/dlPA1OJFiuTje0DGSmSJxhn63kAumCnpEnFhk9
         oukL9B1n67Puk5yWwg5NIK4VqCDt8uDsASw1CrIfgtHABc0nWVZZzI+Q9F9a+LsUYTDN
         C6UDWosF4PiQGeDg4sH8w3PWQHjgvpXnsz+/GjabDKQTpK09reGVau+JjBkwHIrIyhJw
         Hj4AzjQY5lwmrr2MTWy2hZSDs78wwvfAMAvrl0PSiaXbD9gG1EWRcvQ0yGbF/xCoaz3P
         M8Dlt1/1sfDKGCryMSBLX88M+ftWJwYQ9XHgLPS8bxhvKcrnSgJbdyv6jxe/ZeT0ec1r
         ewFA==
X-Forwarded-Encrypted: i=1; AHgh+RrsowWUnOBjPT9QVLUQGKrNzO3/mOrWr/EZTvyRvjuDipfkNQVvdHOS8/MHKxt/mOjj7RhTImSjWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/yqSzPP6sXsOL/hYA1wOL7OVcebLEKw47UFgv4j1dB9mHdQRT
	1lF4FAXvbYq1vp0f5Iyi5cXjzZDSzjMDUgqJs0tlMy6i19PAnsfo1Rd1YoPgpaOg
X-Gm-Gg: AfdE7clmiUnVtlGMPE1yFmdfoidFxKBNIa+YayZVId/JmFOltd9MEwba6sL4sMENM0q
	z0XCY6jO4NR/Z9jk6Qdb1hA56CsErUpuW/PZRKE62xwbtArF++QNdW/LyazqA/aY/aQgZCOEZjN
	VxeXbIweSOHFRqhDj3l6dz/Ylcud7HncK+K1Mxk1aRBtLCHxMQkBFCUxUG8eFCW0oNRZSriXCsG
	cPPGtqVR8M8ey4TwMFDBEsSPJtxlfxcO/mY/MeaMtfvcHRv9UelpLKiYTySwohAdw+pT/yB3tp2
	to9tiTNk81T8O7+Cx5HZ61FifYh8M0L9bNdoy9sSlbk52T+RBOi2OoEjVqDpdpCF5n921JDCx04
	wBCd7cMUXSD1yhub2VDwVpBQdmx2963WU0waHJewa/LZrESnjjOpdGx+fF4w+P/DrTKNtlpkfeu
	Y=
X-Received: by 2002:a17:902:f68b:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2ce9f15ccacmr45287845ad.36.1783832002767;
        Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm81624355ad.71.2026.07.11.21.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Date: Sun, 12 Jul 2026 12:52:33 +0800
Message-ID: <20260712045233.800748-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TL;DR:

The DWMAC on Spacemit K3 is failled to register phy after the reload
the driver module (rmmod then insmod). Because the reset-gpio is
asserted while unloading the driver and is not desserted before reading
the c22 id, which leads to a fault.

Description

In a few days ago, E Shattow reports he has sufferred the a weird issue,
when unloading the spacemit-dwmac driver and then reloading it, he got
the following error:

[   60.713071] mdio_bus stmmac-0: MDIO device at address 1 is missing.

This only occurs when reloading the driver but the first initialization
successed. After some function tracking, I found it is failed at reading
c22 id. The call graph is as the follows:

stmmac_mdio_register
	mdiobus_alloc
	of_mdiobus_register
		__of_mdiobus_register
		__mdiobus_register
		__of_mdiobus_parse_phys
			of_mdiobus_child_is_phy
			of_mdiobus_register_phy
				fwnode_mdiobus_register_phy
					get_phy_device
						get_phy_c22_id

By checking the difference between the initialization process and the
reloading process, I found the reset gpio is asserted in the function
mdiobus_unregister(). And there is no any function desserted this reset
gpio in the loading stage. And in the initialization process, the reset
goio is deasserted.

This bug report is sent as I found it is hard to solve this problem
and ask for help to fix this issue as it is related to the framework
instead of a specific driver.

The possible workaround I found is as the following, just use the phy
id in the compatible string (Confirmed by dlan):
---
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
---
An interesting thing is, moving the reset-gpio to the MDIO bus level
does not solve this problem. Only setting the right phy id can mitigate
the problem.

Regards,
Inochi
