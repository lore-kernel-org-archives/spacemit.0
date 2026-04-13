Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F363563C4
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060358; cv=none; b=KWmgTFCg/0X6TcXnH0Ivqbn+d8d386dvJBUqSQ48Pq9r7q0yC+98mocfirWmwwYsEDZYQILvUC5s/ckGutDiTGD5kC8yz/BwXW6ViZHZerqai0AcUknJmht+dF0hUt1Gpp0p48gjr1yHVjPaH5iydvd9kBeaDS/8a/OfO9irGoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060358; c=relaxed/simple;
	bh=Mp8nGlKsl0cKOOs3q/ULEQWIVfYynz7M94oaQPLQjVM=;
	h=Date:From:Content-Type:Cc:Subject:To:Message-Id:Mime-Version; b=tSTVEzjwrZ2eXV6H7dtHXwuX6ZpJJAt+Anvds1mfLjwjE4tVa5DkqRL8jPpRC8ALTbWpiUiEI2h7jAZ2NX1SkhUfbcIakEGIExpxOXxnGWyO8ai9PRA+EZFDvpkNHkxzxExd/hHEnMmgNKN2oDkpDLcXuwXNU7I69d6Ax6Ek/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=rR0ybaSk; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="rR0ybaSk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776060345;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=jc7SW3G3n7gqDEES3NqW5Omx0t1DvQGVxUWrewOE79c=;
 b=rR0ybaSkWeUEFJxyTc/nNZjsptHaZj/fHMF1Wf/psKULYrevZLewlokwUoJKhCXR9MB0ru
 c6TloqxNgCAM8velyd+m/+JIKQSArzWv3sgNxgoJyXZJBspbcjrYPClUdjIYfPHupGJi3A
 zcElHQyv8Q4K5Mdm3328wrTXUCz8X7m2TsjpGlB105zibcXhBSrZ/+p0fi0aw2PGatOjQS
 i3SfBzeaff37xyel4IxT0SrNopBDL8A9YdJr/SHZMvt9wFb9SInOlnbXNLGI+6FZtIs0Rm
 82DkP+i34KOkN2JJQ46NWi5TszIXR3mGyylrmNwcrZ23xf5tAwZaIuFZGizZrg==
Date: Mon, 13 Apr 2026 14:05:24 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([61.141.250.238]) by smtp.feishu.cn with ESMTPS; Mon, 13 Apr 2026 14:05:42 +0800
Content-Type: text/plain; charset=UTF-8
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
Subject: [PATCH v4 0/2]  Add DeepComputing FML13V05 board dts
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269dc87b7+8f3373+lists.linux.dev+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Message-Id: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is rebased on k1/dt-for-next.

v4:
- Patch 1:
  Add Acked-by Conor Dooley.
- Patch 2:
  Copyright begins from 2026.

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


base-commit: af62a095eb0c3359d477b55ef72d2afd94c83c8f
-- 
2.43.0
