Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474943815F2
	for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753669; cv=none; b=OM9mCkU/COcmkG6fvWKqUY97ZylXL2kyeHzbp7C7lbhRAMBVAfu6TidL7vfMk3uQXD5rBSQgbWzreCBMfNfwDas1SmZdt+t7WvZ+24Ed7UMQw+qY/vN9jKS1uUiRmppPzhbA7RibPx5esoYPLxCckJo+zcRyJ/B5Gf4YhJxH1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753669; c=relaxed/simple;
	bh=4csv3KgUsqp6S8xDiKhYe00qaOjZbEpf8B1tr592LPY=;
	h=Date:Mime-Version:Cc:Subject:Message-Id:To:From:Content-Type; b=LdR2SaCSiZo56LBMw5GPqUmK3oF2x12tRBpk3312vSQ1+JjJbIHbNFsKvyJQQLCT47sl6p1kn0NMiOLpP0k8S8Vk3OzHQXEEf6YIJz+L5jVJQl4Db/a0UkkDC2s0Bs1VyiMPI/3UDS+eOueY0qA7Tnbd0tsP89FVlxK0tLgYUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=0AbhKR9o; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="0AbhKR9o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753662;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bOD3EGcybYF59xsN+7vrNuVhjQ9htAdl90lQIE/I3Uc=;
 b=0AbhKR9odaVJolw2A8Cc6aTH9iBHe2iV9ySgdqEoYLkOsxcNLtbkyZZFbD1KnEcJiS6nDs
 Db5BImo4tpprx6TjSylDzjlCErenuu2HsLl9CONIfjcDFfS8qBjmzXUlujv7I6yTVvcN1i
 KJT0B0Ew5Te8KQs5cqXmPA6THFXZxJW4YsHkhyI42X9SwwHFS6ZCu2O99U2An7fSqHZMgQ
 Xhdi0Sc3n09RzzqmFFgRcmLD4REx4W2CBTNs7ROmRyt84HmxPlSpRwjPWCngt3SO669b/5
 7tvGTOEw3dtrEJ+otweCv/HtQohrP7NHzk6WnftWhIqfHtK/teUCAbeQjWDDOQ==
Date: Tue, 21 Apr 2026 14:40:21 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269e71bfb+4a3a0e+lists.linux.dev+sandie.cao@deepcomputing.io>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
Message-Id: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:40:58 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is rebased on next-20260420.

v5:
rebased on next-20260420.

v4:
- Patch 1:
  Add Acked-by Conor Dooley.
- Patch 2:
  Copyright begins from 2026.
Link to v4: https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepcomputing.io/

v3:
rebased on k1/dt-for-next.
- Patch 1:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal system.
- Patch 2:
   Use formal format user name.
   Remove Reviewed-by Heinrich Schuchardt from internal system.
   Add uart0 pinctrl.
Link to v3: https://lore.kernel.org/all/20260407055557.1202713-1-sandie.cao@deepcomputing.io/
 
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


base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
-- 
2.43.0
