Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E63793C8
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541453; cv=none; b=UnI/+nkRWqR4OoaQ7UlfAYSEVWvYGn+GvahqfnZNCssLbly+ebrpJ3E0Or1BQUU9T+0EcSM3As2MLH1Gr8UQRzFF3EXQGgeuBzLbNKmnaWfIkrZcDmEE7GfZ3L5hw22jbYxp3qSk/S85AOEPxh+68R6YRO6CEE2LSxvLuFg8wIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541453; c=relaxed/simple;
	bh=zK063f5vJs8d4NSisBOSlWo//Lk2qaqpvvCG6lxzrQo=;
	h=Date:In-Reply-To:Content-Type:Cc:Message-Id:References:To:From:
	 Subject:Mime-Version; b=H13leu5GJVVTDi1NX3UkmW22GshAcEtVKW3OG9fUFp2oQXfwS4Ips4/FerixJa4557f9ZLJlo+eB3xR9BesM5HIp0GEvpZZ0M7Slx+EUxlRKWsElruu1DZas3KCHYEGnF9SNCyYtxin7QXfvEKDONEfmAuChmu0UiNoqmZwy5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=SQ14HydW; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="SQ14HydW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775541446;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pbcWRNal8Au0QhSjQPOsXBbyLTIaEzxxGdM+7rilYnY=;
 b=SQ14HydWFFTJFuAcQBsXRnDe0fzbvMV65urDlVcAHsL3WGqfl/Zr3uObBSswpp7BjBk9kl
 7UdJViigM0t9trPKTZ658yJWpoMmf1RyvIBqfN/mMA1dSFfiZA37BXEnuTewNsFamXOibD
 klSX2wGxaK46DHXWwqB9+FPQkLbUPe31EM5u51u3oT3j6EXIaqORKeIobKb/BBDHHrgFiz
 A83fSTjSMhesZWP4sHrQU2OH0NPw+DSUiG/79PirfWDpxtwMa8KOEHQJjQ4g9032F4lH7I
 5T+q6I44kkHvZyXSjP6oS2mgo0fiZnX3uwMhQ90tYoStgTAhwuDq1fo7juewuw==
Date: Tue,  7 Apr 2026 13:57:07 +0800
X-Lms-Return-Path: <lba+269d49cc4+5c28ea+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 07 Apr 2026 13:57:23 +0800
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260407055707.1202730-1-sandie.cao@deepcomputing.io>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
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
