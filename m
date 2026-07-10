Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735F3563FA
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665239; cv=none; b=B6+fQYx1pb86PYgvPwOhPl9DWP3zdSLI2mbrNYtOCHDTv9Oo5mvwirFrTNyi8yuu3MQ5EpPgy8xbHfEzFrx2YFGBdHkB+Ke5vbNkD1xl/i6/CH9P1oOr+pFrBpBmttQOxRrQeNYJHpMZ3/TRN9lRVo6GJIo8tjVg+OVa1JMeFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665239; c=relaxed/simple;
	bh=07/1btrVXweJp2RaQ5t9utHSyW89mMjwV1qoIpkrmwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhkiW6OWib91pkSUPw9MgCcBq+Vomcus0i0uklLHgGUu6vPMxc59+tIUqtvVaOmsC3sxhVyimV//btQUg3XKprMmekb/vkIwdHqS6fJUQGucduGPO9JW11tpeHxP5NLAAP3Zuv4wlIlAmtAXPQutpZklXc5LgaXY4A4rYJKEmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhyMEMmr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhyMEMmr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso794805a91.2
        for <spacemit@lists.linux.dev>; Thu, 09 Jul 2026 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783665238; x=1784270038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWsQiT76w5iSImzPn/o5lN/n7ToH6AkATnCimW/bQDc=;
        b=hhyMEMmrxp81n6ApkIbXrnzX8YW+JrO6QURGazT4No3fc2w8VBTtQxMfcDOSn+WRe6
         FG/JXyreLF/1PKaCn8GRW8fc171Ie2J3mzPXqn0lYld2fNfHi9eGrKkHIbh+LoYQ15q8
         dZ6ghDPIC3qSAufR4u5IaS1OM6wfvDEQIRhGVNqvSm+FyGnhS1OJ2xNLz+i55BszBfTM
         RJPtR4XgGdBKmnzGuoQ1yPW8SWT4M8PhWro8ShV30ySXhuZzvC7xs6V/7mUsOJlFky3Y
         sDWR3Ui/pI/D9JHq8C3/qI5JqWBijKsP+61HJXrlfRctpzRr1IRnNyaXmB7AMKj33LF1
         xKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665238; x=1784270038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWsQiT76w5iSImzPn/o5lN/n7ToH6AkATnCimW/bQDc=;
        b=HiB/cdTQZHUzEh6SrPhfIlJ/vCz7JDDfbkx6RhLtzInQEgN3qtwF/ZZqhqgcY3tk6A
         KXq9yIwbKjJ/G5uOmCqCcqJZp0YoEQNVSP5Fdhl6ESPE1kXX7v8ou3Y7hgOgWy8TrDmx
         I+38JNmbCZe9BJgJJ0oX9MogYytT6+QkFCS7gZe/oduzNexmjA/6H3aHCC/HquqGwBKc
         ud01KQrtTJEXPwpnpwYpUFCfDHINQiTcH7tq8PoauAqTKuIMQFRMxyJwfPQwGs/+k0iq
         ZX6SF1xNtN8MugeXaDa0YEte1EmGSV1nEFGjjBf5bP3+Vh2SAe73Ol7wW1QSG0GkBsZs
         X4kw==
X-Forwarded-Encrypted: i=1; AHgh+RoyAihISJZbzT4PUQaXMPwXoRbVYyfHH2Ft8xAv2m//EpHj1J1WqIOLS/pYqy0t+jBHPFpScqDHGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBsp1pzlyNhpTheXzYEo94lBtG5/dov5z575ql0sygU1lsoy1t
	4TY1MOq9ihCkGN/s4tQJBJBmUxtq2oCV5zYlsYsLRouYWSJeTmR3H36i
X-Gm-Gg: AfdE7ckerr67XBxRka4syGUvKCSvf/2uIGlmED1cLi5l6nWppgo4Le32byDrhs2veCE
	DaEBD8ymZsIQekLWFsTWeKRWOCGwC1XQGeZumIep5p2NU6peJ+44ZPWHXfVAd94A+aUKagYC9Pp
	jCKRMqBxWqtCa1OaJrIhmQb1RSiJl9Iv+6UGnZzeBzRTcsPD0eDgd2l5Bc+0IT1ky5I9/kgADqW
	vFDWqq/vdxeHfia0GKgP3EUbkqyWYPCBUcVcNXYF3w1XF9VmzlkyWdalUt/S8f1DW+RoVyDJK3j
	yXA40YXHZmsW7KZ0bD1vVd86sFjESD+0/0yPqQaUIBxK3oFMKIidP46/bpPYa6EGriPSLrRO9ET
	+fTGBvpR8vM5OMUozufp95ZUW/kzSGSoe4bzhTE0X9bc5IX75oSBOkdVbqQWHnlWcHdMpbyJ+Ic
	Y=
X-Received: by 2002:a17:90b:54cd:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38941101dddmr10813393a91.4.1783665237634;
        Thu, 09 Jul 2026 23:33:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm2307070a91.8.2026.07.09.23.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:33:57 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for the PHY on PICO ITX
Date: Fri, 10 Jul 2026 14:33:12 +0800
Message-ID: <20260710063314.1030249-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL8211F require at least 50ms deassert to guarantee the register
access, 10ms is only enough for the PHY reset.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 1eb5abbc61f9..b2a7d2d0d3a8 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,7 +200,7 @@ phy0: phy@1 {
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <50000>;
 		};
 	};
 };
-- 
2.55.0

