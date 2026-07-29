Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E62BE03C
	for <spacemit@lists.linux.dev>; Wed, 29 Jul 2026 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288274; cv=none; b=tUz8KBt+ZO+eaWPqa7+7fV4ey0KRnJTD3NNoNSsk3rGYymssB3guM2U8+Dn1f60F8XXm75uVy9Wz7KuniS9v3vvB1ITSIlm6PW5vp2sUf7Zwk4MDUl3rFvON6ABnIhr1OwjUsgDvkuOb5IeH5FV6g2dXHD+UZOSqXDDtrtpJ8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288274; c=relaxed/simple;
	bh=9kuNkMh30cWF5g7Vn8rhOkpm0/QjdCZ8taduOQM4uQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsMuu4zdytCWoBzZ2spjKBXm5SAC6xRGIBN9KSDgc7L2s/BbRsbjXWhDKAqBr/ImFdJ1+w9qdWRLIRBpP426D/kvIcpT9bbbnW0rFLef+d2qn3ladPWYm1zF1zNMbOHvwMcSR+F7o6Dj3noiIdZue6+Q6DQI5X7y3qvjhvdE85c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MurFrf1l; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MurFrf1l"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so6848945ad.3
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288273; x=1785893073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=MurFrf1lOQF0XcyNmwPdHOqZTVOdQIYRiMnJ3hOyWgaGnq6ErgDsvJCQQ8X0gMZxQt
         +g5q6oBP3LiMEy+yQ8SIKNKOFu9iSua0KLPxxtsEFMUtr0gdSdvyXtvQI0eNzmub3iha
         AY6Y9o1+ZwFeCElII/b8yuTNBfSondvI3ZqZYk4XNai0P6XktIyUGtkOL5/hKvFuYr74
         juV4GDJ24Ul1pU3cGRgvqA183GSms9UeAchMgHkKOX0yBqkpswlB2i6DE+JnnqcQzf1b
         p02AEnr9hHj2owRjC1bPAOOhNbCYSKVtVxhHQqkNvw94dlhNkcc2OGG8gIVgblwtm/rO
         bMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288273; x=1785893073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=Ua82WTjQ+9a7J5A5ZbtiMPmbI17P5lWN33g4ZvhZokBSzg0ZRdNWMIgBFNHVwRCgrD
         mcdMTQUL98mo5Ue/aLX2pfg5HRkZE6fvwar1l0xvhk68JgUqCqJLKXR8bKBxrDjSPGcK
         6ZWT8aEhujyPJ/e+nDJdEQ5dIQgnxefKp1PGfJOzC+HjaFsLgrufJBPxb6FjXzTzC2VL
         ZpX4PF7d0uukjoP98jt9hnrzyNrUEa9oAy3ZKfpAOB4BFfRE8oGpXXFbPC4z31zWAtfL
         cQms9j4ATlK6MX2e8ODG2MMF43PgncRGUft6+Kfk/9atZ0LidMzHi/+BfRv4MCZWaMCX
         5cOw==
X-Forwarded-Encrypted: i=1; AHgh+RqtFcW04LFc+MnukInQgnOw5qxi4ruzFPPsV3hCczTZpHwtjeQk/qibJIHjuJpr6R23PZcVamOddA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOOYyPJOZXw5saeFlH1KPXCo7ZhPeAYoFSCPj7vvxPIH9u10qM
	yuIPyhUKDYxLDfOEMyoKXGe4j91xap8VcUxaTZ3xcVNpLBvdKjS22lzb
X-Gm-Gg: AR+sD13kdzkMvEAULQ1IEnorObOUAuVkqDLNPQZenNLiHDWr1RnQIlTTmeTuSdriRDr
	X80t6UfIJ2o6dd25B27d8EtWgV+kWjSxQ6TD+U/CjIxqvmo8Jz2EN1fdNsNIymoMtcrzfep86r1
	+IxVqjtOuCZ4Z7SAuNoG/t4RNp3YJvmkRlDdgBhqppvZgN1eEOs9ZYnOzi3+kc9ulbPixi5aB2C
	BJdpw0uH/oP2hKFMyXTgECj0r4IiEFOcvRzpB8dfTSxFpYo6fxR7BteQQ1TDAJLQ39fCp3vZCJJ
	bzKW19YI4uGoDFV4KbyAOTN1hQjTfiaf309dn59Ii6O9gcAQ0zHcDDgv55yR2k8EC1S+o7rME2m
	7/l2tYy9l6wduklMossTKRlrzNpPhkOVoloWNu9KV7j8zURFG6Owy4JGp8Z8uEPqmKv9VxQ80Uc
	tdL4rCzOCp4Zu2L2BvSxWkwcwfN+3A3ne2LnAP9uqajJu8RBUZ8c4DCDTjChsHlQHjCZM+sQ==
X-Received: by 2002:a17:90b:5205:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f6a3d599fmr5804183a91.5.1785288272736;
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm569244a91.10.2026.07.28.18.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
Date: Wed, 29 Jul 2026 09:24:17 +0800
Message-ID: <20260729012418.154652-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
References: <20260729012418.154652-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the previous commit does not change the phy node name,
the dtschema can not recognize the type of the ethernet phy,
so the following error is produced:

/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', '
reset-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 9db839d52ccd ("riscv: dts: spacemit: Fix phy id check for the phy on com260 board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 2a07cd8f2a56..c7a04a338d08 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -173,7 +173,7 @@ &eth1 {
 	status = "okay";
 
 	mdio {
-		phy1: phy@1 {
+		phy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
-- 
2.55.0

