Received: from va-2-49.ptr.blmpb.com (va-2-49.ptr.blmpb.com [209.127.231.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53543CB2FE
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942008; cv=none; b=AfticX8tEsdLU/0j9DEhyodL2LP2PUEoMCcNeEAAB3TH0NAt8zPhiXl335DrkSvMjkA5P3sVnFTs28gUzy5RyWAJ4vsq9dQ+N5DSSUctBOvvUjheK6DdKpNgUKV9RBxeG7hPmBKaPTJM2FiKFCWSnPsP9BjIAGp/dgRPCbRIlrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942008; c=relaxed/simple;
	bh=k1rsPaWJ4Qv2ieYkin+GJzrEKodqZasRzt+A1M6y97w=;
	h=Content-Type:From:Date:Message-Id:To:Mime-Version:In-Reply-To:Cc:
	 Subject:References; b=NMaaI2skn/13wAzjJ3gSAAi2StfX/Zep/13bezmmmuMTLum3fJV7xsLRLR0/hwVEtI83GFhh/qe2PWprk+sA/wss0zB8BFvm9qNCeaw5Xut4WQXz1eG5h4vA+unlzO3zjRZAhXRDmF2UmNXdMMFRLL/kVDUZ9KQBbA2w8ckdg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=MvcMZm5o; arc=none smtp.client-ip=209.127.231.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="MvcMZm5o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941173;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=GQDq7xcPmGfMBCPBOoJzK5rFck21n/XBBgQtt8mMdD0=;
 b=MvcMZm5oSdctm4cRKprkzy8jArHx3mJFhjmk8zcoGwcfzzCMkERmxb9Dr2Brf7TvG20oW5
 5eX1UiQ0A94elZhPdyq0zaqxZTnZZXKO68X9oabVkqYpmMQT9gzCQpnug7wsz7yKeZOAdg
 O3j3Tf7J94RJsC1cFzP2fe4TmdENKllPNPmD3BLbuXolqfM807u6iUZ1bjspyuDySo8IWF
 HASTrPIznRAa603acg2WgwxikdOr/+7aNnnuMGUnAxlkbmOSrzEsmOgjHDTWF/ZIQO8onj
 d6pRL9T/f/L0k7OihJxeukPsTZSY7YdWC61p51hsmTd5P3b8nVkI0x+rLEO7HQ==
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 15:12:38 +0800
Message-Id: <20260331071238.68336-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
To: "Conor Dooley" <conor+dt@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+269cb73f3+2f8946+lists.linux.dev+sandie.cao@deepcomputing.io>
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
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 15:12:50 +0800

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
   Use formal format user name.
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
