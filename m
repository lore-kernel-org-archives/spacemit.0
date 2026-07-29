Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236F29DB6C
	for <spacemit@lists.linux.dev>; Wed, 29 Jul 2026 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288272; cv=none; b=FDCWd1+jEyqlz+njvNq9BZrWND9Lit+qS1QzhBJT1jg0S57cOQB3tiq3r/V1s+dbPPtHv1pGMB+xfzP2/oweIYtkQp42SGiiqe6Gj1B9Kr/FckLryrtayA26W1qVewfeumKieptIhLLXIkuwiO7gkqK9EgYztMQrBc+t0iVXENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288272; c=relaxed/simple;
	bh=FijwwOL07zQKE2wPhWBm6Nh3wRruwgeJcnKYzc3Ngjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4AfyhoQfkHuVVdGxzkUpX+KlAWLAErvvhJgJn5g2KuM13yzeWNycfPclmL2jq236Ivz8wqXZeN6baFtrtt+eyzJwSTuGlF050bMea8J+p/pt1gltHl5fk7wVSNAa0Xtgz3L/h6JLQE6GOQBdIw9X/woJzB8zRzM1nUHHfJjfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSZYzXzq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSZYzXzq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so438790b3a.3
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288270; x=1785893070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=OSZYzXzqYpyLaOdpqC2LP22rr/2mjXHxGxAX5tFpDxR6XWS+dlO/EUyqhylp13fP8x
         gd54Jt7308NHQvV4u2GkgVzFDmHx+MRQzOCTPfiJAU2X4DOyOnBtDv9pn83P01qbezzS
         gPql+o9OhwBjJnBhlKy4kLCfrVyKUjUqcvEfbMpHrt5NilIiPlc1VCdMG4DgC6FhDdBL
         ps1kT3UuRDTJYRrmTZ/VunUXRxicyaSkULtBOKQjq083tJxv16xAHpKdvpgvJRJFY0W3
         z6scVFImNvg+d5I41oKprFlr9nT6Pq+xTozyWA2qkaf+XaaL+f37mm/7nvVlOzIjsSXw
         7hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288270; x=1785893070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=YD8zv2OBVf35IVUdoLBHWfuv3KhI2ISikpB/ETmyTIa0tZU0rSNv6N2NpxXQBLyXG+
         PO7nqHPM+vVMrx1Pbvvad0r3xrC3LfrOG2RH/eXZknzdSn07Xlbf6KhSern6gUI3sDfR
         ShN+1Yf4F3a1dljzF2bSzV7xnTNmbq6JPVnGuxzeXja+DbIghHsPbZAN4XpPxpT/WfiW
         nvzjJEv9xD9cOE3KiwYohk1ydl+bqg0kVfqRBangaSlpBNwcWEVBWLecpbhUyyoGKGyu
         V06j5de0OP3oAOY9gypWiirYxTPge+0hXW2jtUosEB48TLAFLjlByNzIB22iFR+axH9M
         Tk1g==
X-Forwarded-Encrypted: i=1; AHgh+RrYp2KSh7e6evytir4e9vXYAIlWtJuqwkf177ID4AlslM5IzxwY8Bid8/8515MaZl+wCP41CbVCdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCtudWu4cxSEBoFBeKd2LHvNtidxgQtDm8yvsp2azFEsMelY7A
	hfhoDdRIOxbUZjd/UtqcVUKKrqPPeXuNKlUSgFGoFEOknAyjpixIqZjS
X-Gm-Gg: AR+sD12+FMCvzZvh60ZJxHU7bQHxv/rMMeMWPzPi7lxZSQbEKgOc9d4xGPhfdmom2Z2
	7XCOGaUXUIzvmVdcWR84rDw3DfnevwQ3jBdhdcoy3SJWgl7jMXQM1QRy+eGKVVePlzwpuKRv6lr
	HLT5FOJ/C2ber5mM9k+YiQ9srDO0INrCsmT1EjNguZhFm31dqJuaQVpGoLslLhKUvS4afXcTjJW
	IUzuOBLeE1CygM6qIbUpYVUKl7jsHWDqlA9zzn/QpDtWGlNJ2KEVNZI03zJbiJ/8jBEbjPOnsbt
	U4xYuzKt7FA4k48wgaquzjvW5fRwJng1th9sGNUK8RegLx9qw8aaKKzuva35SQVRbsANYa51xVP
	aocCEC0/awDB1YE7KnxNAEc88OqoHO9ie3mSaJpdKgpwxAc218vI8oj31RCiGd6jXmylKTamVYv
	k788j/G3qCan8f33CkxTBR5NLFZfAF40cudkhVJWjn8pAN1C2gJMA1YEvUlF0=
X-Received: by 2002:a05:6a00:1248:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e9331b006mr4904021b3a.46.1785288270033;
        Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm595509b3a.1.2026.07.28.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:29 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
Date: Wed, 29 Jul 2026 09:24:16 +0800
Message-ID: <20260729012418.154652-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
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

/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
set-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 6d6536c880fe ("riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d78416f3118e..e91a4712f2db 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -195,7 +195,7 @@ &eth0 {
 	status = "okay";
 
 	mdio {
-		phy0: phy@1 {
+		phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
-- 
2.55.0

