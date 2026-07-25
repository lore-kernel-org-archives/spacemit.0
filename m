Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA936F405
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022445; cv=none; b=Z2uS16P4IXaQFtLzc/w1qPi4Ojnke8vPdjwRTzXlhw4C2WhCJbbHPi9PEyzww+lcRa+IiyHegpF0mQlmdh+hU7yEieYzy7RQ7732fvaWff0eAvi5Na9bf1sytuLy9yFEMTnoRtadeNAxoNSpDWN7PRrYrV7kF7lUtmIRSI3O5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022445; c=relaxed/simple;
	bh=lEjLl6qQ1+Iust3EDUG6IS6NZWSGdOBAlgQahlehZjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyB+1CcYyVlRNEjdP/ikI0JvenHsn8UFw2ZcUZB+eTmUzXLahHveWBJkS+Wxf+umNk3VmeRha5wIA62rN2lXutPj39x9fCcF9Oj9XsbRfCuHpG3JNGIg00MZAlk+2VVIxoSRd8K6imQDuSyNtVArhuwyYk1OW2qrTVO+OGLOQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPWapgr5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPWapgr5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1670166b3a.3
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022443; x=1785627243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=CPWapgr5FyhAblMPX9PSPAC0w80XQtKtBkqLXwqZJBzEPzaW7yLj6eRC/69CG8H2AV
         uo1QMOx26doJgJkRi61HYI++dAf0/yPQkFFE0dIcwDSTLHNGTOGVFayo2E8jWMs22iwU
         g5NCCoWTzxNjOFGjXgzcH/4Swj0PHWpis77VSR9GDWSkhZRj8/QTaOmLdHorwuu/gRUH
         a9wPB0CKON7ZGOISnMLq1zm1bRXGK9gMjGsv75boJ7aMpSJFDolUSv5qkpIgHikmKkkg
         HGKjtyL1284e2vYmSU+5udX9giQ8j0Y9oJOGlHfd6ktFIaMICTyMSpN/dsiL2GP+EDGm
         voLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022443; x=1785627243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=SL/y4aYxg8OerPgZYkLWrac81MqWr9RyUsAp2hFEIESHOKRpwe+osOi0RSREeIzByz
         rCQtQWeJ18OUpeM2CGEtFxRKCPA1gUFjDRNsRpgtJY3N7XKovtKn694YF6548rQjoXkZ
         6wjyIbjQeArJidSzPEXWmu2P5+P1IMoH1EH5a1kMRZ5PhJ4jJsonpOnZBUHGCCF4apvx
         5XAy4ReD0ov1A0vOFIzhgs5jZIWpzKEDUGQU8b9pEQAETmrP5JiqhNoUl3BCxwkbaZFD
         udFMc7CbieEPBKouh8u5RkTjymFZz5CdPbsZdUjiz9C7FZa428DJzw5enKSSV4qLNWMv
         jqVw==
X-Forwarded-Encrypted: i=1; AHgh+RpbuneRSro4uCXXy1wZM/Bu+ERUUhoCIRjRlKty1OGjlumm9fql2phumJtBhk187oGhd5TwENyCUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqiAppqo95JPaSJpK+Vk40zkTAgPlDqbzjmV5e1k6fm/vfBf0A
	uodYhzxj8jpgWXjg89kqBAcnOgAB60bHqHJ5iC6wQ5pWh1sLnxVdtZ3m
X-Gm-Gg: AR+sD13vpwHQxW8YBA1AIpeEYAuypZIYw5pF6CDF/OFOo0UMR+ZtY3mnDk+kqOhKccA
	d5bYlB5suDu0K36cYWM57Z6T25IiN9J7eAGLMz8Grcf+bTVZwbzVUL9+AXCEhIXo3+sQlW3vwSG
	pHs6r90aRUfmdB08xIysXFIM+3/c6m8l+pVBLKVmlyLIJkYG+I3T41257ACt9XHS/a9zus6z+zb
	ZQULrlTZR9zRkNPcBl/3edJQVT+FgDm551LIBLuakqLEELvn7Xe4G3OskuHGBXpewcK9nExzY8D
	aMVIuM7KPMNNT5B+vaqXa0sLYI/PBwauk0HRmg9M08t6Wsf+g/YdDD4jcDNlxj2ACDHJmbo+txO
	qwTp3Vji7oXPBwi5GQINxPwQFil35LoEfpAgoctEaBz98HsPgMo2FaKYJq8NSbc+wVNIUC/Octi
	4K
X-Received: by 2002:a05:6a00:9283:b0:848:63fb:fd91 with SMTP id d2e1a72fcca58-84e59546fc9mr2996113b3a.41.1785022443208;
        Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm1410168b3a.28.2026.07.25.16.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
Date: Sun, 26 Jul 2026 07:33:49 +0800
Message-ID: <20260725233351.55004-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
References: <20260725233351.55004-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current phy framework can not re-initialize the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be read. Setting the
phy id of board pico-itx manually so the phy id detection can be skipped.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Reported-by: E Shattow <e@freeshell.de>
Reported-by: Inochi Amaoto <inochiama@gmail.com>
Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b2a7d2d0d3a8..d78416f3118e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,7 @@ &eth0 {
 
 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

