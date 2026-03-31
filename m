Received: from sg-3-26.ptr.tlmpb.com (sg-3-26.ptr.tlmpb.com [101.45.255.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A32C3244
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 03:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929414; cv=none; b=Yk92+uuvyAjWTgj6iYtdXnyxI1oE0fd+WGSvrZ+dnW4tJvbwo6TfOiZdUDXqIq7mZ9b6E3mOQWj6l+Kdwo8eBhyP28+tOV4L5eB3WLLZeJDoGh+G51mQX+g4L/WD6Dtazudi+OhpdJsowa2CBDem6hMydkCXcKlr5EPDj09l0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929414; c=relaxed/simple;
	bh=DSx148ie2cdYVVTihZhnmpl0/0GKwVXfxSnMpwWHaGk=;
	h=Cc:Subject:Mime-Version:To:Content-Type:Date:Message-Id:From; b=JFbaf+MEeBtMIwh3D+3zOiAkL8ys0vUx3bfO2WkCRWDBV1P8VQpkt/2udopsqo04RE8eaXRfCwRj54kS8kSobtXx1ugqfRJXyF7a1UABhsysgL4E0RVY4pkYoybN5xTWEp98Oo47/3rGBZooMuGOlctRgylHwgXsfehAY4GxvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=HyTzhb7b; arc=none smtp.client-ip=101.45.255.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="HyTzhb7b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=uxHkUdFeg/FwNhES/kW73MVWxcRL8iwer3YLvVez//k=;
 b=HyTzhb7b/RkD6DuxO0T3sFM9vkwzchwHdkgenoZZXcNpCCr3OyztYnacAUjJSo4OUPj7tn
 Bq15KJCyQv1awjQcD9bfwCT1pBrX8IVpjgCZCROJM2Bdn/frQ4vbWUmQxkaVn6DCPI+EeX
 y3ZqvGaFg86446diohCVni3jVA3nt4a9TcS6VxlYdLeesknayF3a+m9/yOBjpx2l22F8Jh
 d9O6ohieLPRQrBFyKa6XFLFcZLa/AdWyPJNbKtKe7Sv57s1hIo8ziGSiFdIEyEihuyynGV
 BbCgcTD85nUFGYmkvzMXocRiCnICZkFFeZJrbJuJpMVANmM41lQyUeFvrIcUwg==
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
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v1 0/2]  Add DeepComputing FML13V05 board dts
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269cb4328+8bdcd1+lists.linux.dev+sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:44:40 +0800
To: "Conor Dooley" <conor+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 11:44:23 +0800
Message-Id: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is based on riscv-dt-for-next.

sandiecao (2):
  dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
  riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts


base-commit: 4a1739c30fc66a59450c1f78923f94607e786882
-- 
2.43.0
