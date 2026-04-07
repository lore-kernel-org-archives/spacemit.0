Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017EA372B5A
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 05:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541396; cv=none; b=aApvVpYyNC0hiWg0Oryt4tIF5KEGC8X/ElIEIriDgO7pe9J0JoENJvKyF9Ky0J7yopbAbvYI8rE7+rmI66C6DCOH/TEfFGHCzUbNKjItzR4klITaXcTOXIzfZ1fzT9nLwLJsL3x+WYe5DMrt7/cnp6Qo05aD3gyJGC1Bo1zHPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541396; c=relaxed/simple;
	bh=ObVhZQPJwXVDAWpzr2YjOKd7mcMvQEv/KKSlUZjSqWM=;
	h=Date:Mime-Version:Content-Type:To:Cc:From:Subject:Message-Id; b=UJj6nX5nnKsdSOlEtL06VCDBGH2wQP1KEzHNSXkrrGGafDxljcCoTInKjUo90F7+j/GO66gQmLXtBiFKQ4rYAnDsBeW5Ln+k+o1crGX78vD1F+si91xNS43dwbYnfsCUnXcLsbuoGCE+49JkLlaargnWOEv8YHgnjC7JfToMMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=rufrBMjI; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="rufrBMjI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775541382;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=hRilJHTgzt+xM5u5r+LCoIm/YrLkOdRsPbaxFkfbYqA=;
 b=rufrBMjIIFhtbiYPlkGSQLjS1Qy1oks8Y2g4K57Rm2neyxMxCzK6uRJbeggFAHYcuzIxev
 gOzYthkxf4pm12EjaffgzQnmIgeSDUVtxwvpGstG+/w8NR+Xdt9k8Y6rcH6ykf2l95YqTr
 Xr/6cZgcjTciTM3bJkqhGQvakANNbglhtWGOgvvhO7y7Xzz7tX96cuzlrH/l7+I+nAq+Tx
 JBiFE93Zb07CzTT8plexWiDb/N01plL/qvD0JRIdgxRllgeXLEYGMuaWs4Oh6Dqm2t8dcp
 8duXFlup5aqPAdPpeDoyaZkwLjj2NxSxcK+uSS8V0A3pxHxtc2Ps1WMxnAJzPw==
Date: Tue,  7 Apr 2026 13:55:57 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 07 Apr 2026 13:56:19 +0800
X-Lms-Return-Path: <lba+269d49c84+42f1f5+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
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
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 0/2] Add DeepComputing FML13V05 board dts
Message-Id: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is rebased on k1/dt-for-next.

v3:
rebased on k1/dt-for-next.
- Patch 1:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal sysstem.
- Patch 2:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal sysstem.
   Add uart0 pinctrl.

v2 (deprecated):
Link to v2: https://lore.kernel.org/all/20260331071110.68321-1-sandie.cao@deepcomputing.io/

v1:
Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/

Sandie Cao (2):
  dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
  riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts


base-commit: af62a095eb0c3359d477b55ef72d2afd94c83c8f
-- 
2.43.0
