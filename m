Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B7381AEF
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256888; cv=pass; b=iGof4YBcVEfXf68U85jfktBbgCkeSI4OBakhmAAiFsuYgWn2Z64gRha0rVgsc2Hrr4kN5kVQ8g8fT+WRH5EuPkFzQ85S9gozZgs9Eb9Um4j//H9Rcy3e2vlb+/rlC5Ea4gQoiIomqyDOBaHntN5xd4jsamZx5kr974yotNsXecw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256888; c=relaxed/simple;
	bh=tNg5fQbD/+z6GIaSXIU1W+5GhX2fSWegOJzAhmVQZ8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YoOLz2B3LxBRijOlbmrPNfwj8EjvoDnSk9G77Ap0N8DpUtjbQDBixF5P8iEcYeNUv286dZbBzqjGFH7uOXbQ9Nwmqt8TZ05qpNOz6Fx+22agnS1Q1frKw6yd4Rb+rZpriEU5U5PU+ZbYcXxyog8kg7S5gldDBBgM8qdC3h8MIjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=YvUN7Plm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="YvUN7Plm"
ARC-Seal: i=1; a=rsa-sha256; t=1785256875; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ODQU9J8WquXICZDIDUqri1aGzugYN1IgEo8gXefLQk2VCj3ywRKyi+H0bK18c2TJ7vd5WRPS2A0Q0WEQky/AK5TbBlFo9WeniKj+2HZAVmDdSzGv2JMdpaGAMuDR0Cn4/CtxJyVlBbN8cytBXg4h3ewLYyQR/JWy/BXrSxsycLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256875; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6XiCb3evbpJrCfe6+gAZAYoNBFBzKa5QdpNuV3NP9Ao=; 
	b=Yl1epMAc0V9MDm9eRby5Yl/+ssAWK3xpIfGyblvSX9jAG9+SNor9/I0IPOmSwkxrCCltJOzbPNxmv6fn1drBMbxfuKzDB3CwgyaGuJpZtyQk7k0L4qVrv25TAlpbqQ6x/DJuUgcxyc71904KqF5zQrD2MNoGjw4jNyKTYJRI8Jk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256875;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=6XiCb3evbpJrCfe6+gAZAYoNBFBzKa5QdpNuV3NP9Ao=;
	b=YvUN7Plmsr0Pczl17igM7no3ZSrGEVzP6U++iGaKF9lTo6z+9SUVAx9QhunNT/fq
	IDI/On5ulNUW+x+Fc/qv4qNTXva9/U0AdopxQEyGsHyngFIRHKDECIavQNG+pJexlTl
	G8KkvZM9SXR1Q3JO6KFu5QrDbNSuWCb4gMYipvTc=
Received: by mx.zohomail.com with SMTPS id 1785256872287716.7797613609929;
	Tue, 28 Jul 2026 09:41:12 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:40:15 +0800
Subject: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from
 M-level IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNL3Wxj3dzM3OLMZN20zApdM0ODlCSL5MRE4+QUJaCegqJUoDDYvOh
 YCL+4NCkrNbkEZIhSbS0AYbws5HEAAAA=
X-Change-ID: 20260729-k3-mimsic-fix-610db8caa3cd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=tNg5fQbD/+z6GIaSXIU1W+5GhX2fSWegOJzAhmVQZ8U=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybs+78Ud+EvO72WcCphxWvSmz3D7gv3tEw2fd36vET
 h0T8buU2lHKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBE7ncxMqzPXykqFnC8MkW+
 x31P9tSWdxcTVp3WEf+8Y+nC1yl+M34yMvSGnxZ4kMWXHfdI4RnzQz1vvRATlrRPi8u3OKzew/Z
 5OicA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The mimsic node describes the machine-level IMSIC, whose MMIO region is
0x10000 (64 KiB) for all 8 harts. However, the node also specifies
riscv,guest-index-bits = <6>, and per the AIA specification the
per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
files exist, i.e. 2^(6 + 12) = 256 KiB per hart and 2 MiB for all 8
harts. The described region cannot hold even a single hart's files, so
the node contradicts itself. OpenSBI enforces exactly this constraint in
imsic_data_check() and rejects the node with -EINVAL, preventing the
M-level IMSIC from initializing:

  fdt_driver_init_by_offset: interrupt-controller@f1000000 (riscv,imsics) init failed: -3
  init_coldboot: irqchip init failed (error -3)

Moreover, guest interrupt files exist to act as the supervisor-level
interrupt files of virtual harts; there is no machine-level counterpart.
riscv,num-guest-ids is equally meaningless for the machine-level IMSIC.

Drop both "riscv,guest-index-bits" and "riscv,num-guest-ids" properties
from the mimsic node so the node matches the actual hardware layout.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..2d022e1364f1 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1287,9 +1287,7 @@ mimsic: interrupt-controller@f1000000 {
 					      <&cpu4_intc 11>, <&cpu5_intc 11>,
 					      <&cpu6_intc 11>, <&cpu7_intc 11>;
 			msi-controller;
-			riscv,guest-index-bits = <6>;
 			riscv,hart-index-bits = <4>;
-			riscv,num-guest-ids = <511>;
 			riscv,num-ids = <511>;
 			status = "reserved";
 		};

---
base-commit: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6
change-id: 20260729-k3-mimsic-fix-610db8caa3cd

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

