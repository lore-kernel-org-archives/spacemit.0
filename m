Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD43DCD88
	for <spacemit@lists.linux.dev>; Thu,  2 Apr 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124034; cv=none; b=E7noUIHhSvZtdQiATUiWb36GxwekcMH5SdjIciAD2a26iOWYeXVKqZ8AXnM2ysRIIaLcDhCXIfxWgVfxq8BzZw4MzXOngiiQI295zGAmo14cJPa9YFerojit/aVNGVORQY5sadx6YhCXoXc7WRYHhJrR5ms6d7SwtjFZ86HQvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124034; c=relaxed/simple;
	bh=bekxGwgFyIEsSg12/F4N4UIAh6Z/E2DJc8FjyvGvSLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=goHdMp2SLB9fT2JXCMg0LIuC06G9OSZm1asS6N/uKVtf96aySf/h8OxM6VkXYDzGeUIWLibmWCckgFf0fUS9nPsTBL+lUDJnemPzpUIvJgWfvSSplO34JERU+/r4jlDGPtq41OeqN/SBztNuxX2oTq+hUM3IFeBddN2O9Yqhk2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 394e0eafe;
	Thu, 2 Apr 2026 18:00:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/3] riscv: dts: spacemit: enable USB3 on OrangePi
Date: Thu,  2 Apr 2026 18:00:04 +0800
Message-Id: <20260402100007.110201-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4da2f36c03a2kunmcba6113b55c18d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkodVkoeH05DGR4YTENPH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Changes in v2:
- Drop common board dtsi and PCIe regulator
- Enable USB3 on OrangePi R2S and RV2 boards
- Link to v1: https://lore.kernel.org/lkml/20260116100001.208334-2-amadeus@jmu.edu.cn/

There is no publicly available schematic for the OrangePi R2S.
The schematic of OrangePi RV2 is available at:
https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Chukun Pan (3):
  riscv: dts: spacemit: add fixed regulators for OrangePi
  riscv: dts: spacemit: enable USB3 on OrangePi R2S
  riscv: dts: spacemit: enable USB3 on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 43 +++++++++++++++++++
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 2 files changed, 86 insertions(+)

-- 
2.34.1

