Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72517314B6D
	for <spacemit@lists.linux.dev>; Thu, 28 May 2026 05:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945864; cv=pass; b=XO1zWL8K/3LxkNce1jYDTD3fZ4zb4d5+fPXZiI8yeNVYcykbsLpyHSdQ0UU2E+yQtJRcNNHyVDvdrU/q0TT1cBruDcmj/4RupSW433KGtrHQYMa2qgVSWe8IQy6Kq/gKIyIrshUggkBLzVQshDZaLaQ42HcQfO7UEhJFq9vOcoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945864; c=relaxed/simple;
	bh=ImaB2JWrg33Dniu6feVCqgtEyOGIW/e1dFOZ+mc6LVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ezr0VKz70hbXdGW/muhOd47Pu93GjVzLwtfARpOMKuY37v9EpP62nLKIecmAoXHrr0E3q+MWaEN2EqchKBB8m7kwN5EFLNeU3JK6OTq8CFMWjM+V8JoTSaxMO+WlYfHVJeRkG3IbgoNc38ewQPjoOxAw/RW7hty0btxQLeeSHDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=i8ev4/Ob; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="i8ev4/Ob"
ARC-Seal: i=1; a=rsa-sha256; t=1779945849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f8YKTaqC1kvke/STjLydsO3a4CcRunHG3e4ETUypLPjJ4Q1Y/t8JbMnZguoRbnMx3ikVNNPCy+QFQ37Z6PtilavZv9hieaP2qRQwJM8FZRCMaPp0KzSLfZqdrlgdqphGQUskVQa04wbHEq8JTrripd86ugHxTexbQHf4fAmJLJI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779945849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UvjTRA8xfkxxljRes0fA/LWYD4fR4TwEvH3UGlFAtO4=; 
	b=HP6VSWJV+fHtWeYoSjT7rGtBENU6euv27SCC6Hw8CACfYTg1Tn6QyMojuMwhYA9OlhlQrToWQkxPW/cWSYPqpPACaMvohzl6iab0Wb9PPzjAM+ZYC9RxAQDDxGFTSPiymrjHiJmorxhGUy15WPTtLQqYctelIIXV9yCj8StONTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779945849;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UvjTRA8xfkxxljRes0fA/LWYD4fR4TwEvH3UGlFAtO4=;
	b=i8ev4/ObvNcHZsnmi+aCXDIvjUr9Ghg/Q+W43MSLHeInOt8x++//CpQq6jj5onKA
	Fgd3I/9+onVLGi3vwcisIq/8AEvkJPJUpBJFEtGDdi1oWH6nbs1Ih1MXnNFgSCZjm4K
	hSIPT3eT8allVcwKgRTYpJCwOUSjv8d9jTSiIh5U=
Received: by mx.zohomail.com with SMTPS id 1779945847005535.3101057500668;
	Wed, 27 May 2026 22:24:07 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 28 May 2026 13:22:47 +0800
Subject: [PATCH v2 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-bpi-cm6-v2-1-d0eb3f236cea@pigmoral.tech>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
In-Reply-To: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779945818; l=1249;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ImaB2JWrg33Dniu6feVCqgtEyOGIW/e1dFOZ+mc6LVc=;
 b=QsO2j5hlPX7w0nZYJgUThKPZPZkKQcnemcgMwpGpULbrk/OSx07adKK7zkJQI7ZztZB8zJjnY
 pc1kUjYaKxHAJAdZJOoURYbFhj4cwf/Kz+q/pKDhNhPVtjWQUiEYmdz
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

The Banana Pi BPI-CM6 IO board consists of the BPI-CM6 compute module
plugged into an IO carrier board, which is used for evaluation and
development.

The core CM6 module is based on the SpacemiT K1 SoC and provides PMIC,
DDR, the eth0 PHY and wireless connectivity. The carrier board extends
this by adding the eth1 PHY and external interfaces including Ethernet,
PCIe M.2, USB, MicroSD, QSPI, and serial console connectivity.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index af8030242bdc..3e868383eb4a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -19,6 +19,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-cm6-io
+          - const: bananapi,bpi-cm6
+          - const: spacemit,k1
       - items:
           - enum:
               - bananapi,bpi-f3

-- 
2.54.0

