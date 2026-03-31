Received: from sg-3-27.ptr.tlmpb.com (sg-3-27.ptr.tlmpb.com [101.45.255.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D432C0F6D
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774928803; cv=none; b=Uj+hjdHI4r+fCGKn56Y+rzORrMhBwDLupGxw9tsNJORgU+cWw4Zq+yX5SCUacjBVV11K4TeujZ6HsvnvGy3pbHK0JEqbls+g0FgrXRGhxZb1A4WNrn3+K4xjp9h9m6nLcOMUCzrvRijhktPvnbA8K6MGvzVj0n6rMCa/8UMpmvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774928803; c=relaxed/simple;
	bh=MX6CzuviI+/EnFy0Q6mBW1NCykplXKMI8oP2t7QU72M=;
	h=To:Subject:Cc:Mime-Version:References:Date:Message-Id:In-Reply-To:
	 From:Content-Type; b=qrSgDGkH+mJzj/NKE6brWlALjV+9Ke4Inw9dnNB9jHX/F9d0EQnyD/YSqUeoNQJYXBKxxNtH9vpiVpO2lmcRGj/D6ESoJ4oJZtUb9GA0GAV1Q/39xMyDGYhpMn+BDUnOGPpxxoEafSnjshbyNSAOBg0z2pDvIN1xnRC6Lle6yh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=R5fjyXGG; arc=none smtp.client-ip=101.45.255.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="R5fjyXGG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928756;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8ZrGJtuUZUqfsJ/vLx0Y6+SpVnJ2IBWTOzQzaZB9Dm0=;
 b=R5fjyXGGdW5kOIffatPfw3VxatUWlKXgItoC58HBj7/fjaqPogxluulpDO80YOcRQ2i8yG
 17vWL8Uqxi4/cp6o/mQe/sfIUy3Wm0dxIBtr7/vLiSkZy0vMvDJIiyGMphbQ2+mVHaX+k6
 e/f11wjLA1eUHAkf+l0b+0ys1wpwC7QJP/6lY+4ZHSpWybrM4/Z/zvxG1Gqv8CQWC+sv+/
 NL4jFA9whJ10rPYQzSlAaDhiOnB9BkPKycvug6Rgwk9z1OntQVXbn3qNM/2aFb6/kgcJfl
 V2u87EJH49MJjyP+joJxUetxRTEEP2LfzFdfqyfM3VSxBAoUNbGsfkdq9e6VUw==
To: "Conor Dooley" <conor+dt@kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"sandiecao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 11:45:39 +0800
Message-Id: <20260331034539.67167-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb4372+5ece24+lists.linux.dev+sandie.cao@deepcomputing.io>
In-Reply-To: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([121.34.226.213]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:45:53 +0800
Content-Type: text/plain; charset=UTF-8

From: sandiecao <sandie.cao@deepcomputing.io>

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index b958b94a924d..af8030242bdc 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -29,6 +29,7 @@ properties:
           - const: spacemit,k1
       - items:
           - enum:
+              - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
 
-- 
2.43.0
