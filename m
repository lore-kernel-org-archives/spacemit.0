Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B23242D9
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 23:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022447; cv=none; b=E5318pf7AS0yrq1FfobkVeAhfRvFKiBOIJ8+GDnvh3lsFxYK1MFRQMc3tP5Ge8feJn3E/H8z91wY6tz3Bv1A/KKoKulsyWL48HsQWxxlbIILvmQlQj0/MTbUHVTY0Ytf6DpGHoAcTUu/nHmauavWocvI1hJ8k25GsQzrzB1lpdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022447; c=relaxed/simple;
	bh=ZZlLK3XoNG8URV/25/ZYKSfm0WcLQR3kQ9/ERs/FKmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHYfU+BkJQZQxub4TLB8rMPnojufBINR0ofEe39/eN+Tlcbx+bP4ziUSVmXHQZMK+f+na9pbCGv28HX3+VCWAp+F9qsZmQIDFd3oGnvhyhyrzyJCPSVVEt5+IymcgSc41ct9TyUwhy2uWSYnoqUNBeOec4/6O6OZHZWo/cQPwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifRTqSNa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifRTqSNa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf27856f9cso20193345ad.2
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 16:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022446; x=1785627246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=ifRTqSNa8VZrUGvfjekry9K/LMuJgjv0CSaAp5Zi3HBvxMMmEj8R6nn39RHKbHpICt
         LzPDavQxBOiNF41sF7HCSDGfYPDyZ/6fmUatXGLDgbeLz5ScCGdEl8GIPwCG46whTnO6
         1Xc8BItD5/5IDbY68ATBDQhhP9qCMssxUBDm1J6Nul2rYbP5nf+HCnxh6hxhqLOmrV0U
         kLtr3guUrKQCtEYwAnS4O1vMFhipYqcNGw8g4G6BMxyRSKLYg69cCeK3KnbOyyTRMUFu
         yYntyizI4p/vEyQEtXWvUpk7qLAaTT5QzPv9fwIvtgvz1khfn6P28n/H+f5oX3Zj3Gmp
         EVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022446; x=1785627246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=CbZ6QNgAIJEVeW6R11GuDCbHn4OcSl1K0Rh6+KoDtWuhLiVEtmFF+tRVA4kw+9gbM8
         RiGB6yE5+HaNQfvLVh7Y2t0QTRdbc0wQcgtsEVIis9pQSYkrvAe1sqP+l7gME4ZEM6Pk
         8tM9TDqjSsI7VGRN3aMeFEgltfAiKpQ8psoG9hbwkw9a3pMDNxJrJorRLh9i0/5agk3m
         snHVrlY2TeBpd08NhLpvOwELEMrnaJeOUDU6EKvRU+Zgkh4/BkI9csy85RtfZCNksdE/
         UiYj5d18qlHTKuESG2KYajO873O9erurWtX/NR+NiGElplbAmMAkgyZTYV2Spipkv0+u
         C14Q==
X-Forwarded-Encrypted: i=1; AHgh+RoawIibl3yI1f/ZDRMgjiTQxiWm38r346WV7W/8KbR0Lbd+2G3nO3ttNJsCvSrN6jdKyuOGMeiZGg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2OQkI549O5l739p/4Xs0C5eK0DcMB2hImhDaO0YmdO34SSR2H
	+++3Uo+dtR13oGUok/d0TOtXEJEVQ6nIKDGnRPrgKxGiOJsyBR+Oubyb
X-Gm-Gg: AR+sD10TToGQdTRO4dm3rx3qWSBViryUgQsCQpsNEyL5zmFiUmGpWeIDtpMxUzaSf1o
	tIe++n4XswysJMT7MlNWPChx731CIkERm74p9RLv/60tI2Rgcdlbnrvv3/oGqQOrpWMXypbmGEK
	H9FMDaUaYii2j9dNb/ciXCu/EkQoJEagPXDlasjtIcWSZkrKDo4Kw0IohVCk7wAw7Z51Ta5gBGs
	CPwk1NkrG6MR4M55BPII1n1hgoTqzRGgwY2qOdvT8I28qr5yHvFh5ppf63WAs8JsILkYvG24heA
	OmzHG20CjXooTjFjEzuvBr0RLQfW0eD8J8Ut5gWnQ0qbIonpZ96MWJXS80z2piedBcw8CwErFhH
	PbLWZoBngm9mjrk+NX+SesICiQmMbSWHnzWV2BN+WNUHFDZunT12FyNphmkqvgYONi6wnC0GXFY
	oQ
X-Received: by 2002:a17:902:cf10:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cfde862db4mr31827595ad.32.1785022445940;
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc413sm13661365ad.44.2026.07.25.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sun, 26 Jul 2026 07:33:50 +0800
Message-ID: <20260725233351.55004-3-inochiama@gmail.com>
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
phy id of board com260 manually so the phy id dectection can be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..2a07cd8f2a56 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,7 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

