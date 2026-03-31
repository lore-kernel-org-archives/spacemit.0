Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D483B6379
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941041; cv=none; b=G61FM1PAnOdJrnv7c3sQEBVnmHtuwScMglSDVocV/071EsdReLKZBhfBNJQqQARhzVe+hcLVECCW0m3bLwI6BSrplN5pk3lU8oISu4dNwelO1aNt73ZTjTErkbNBJkC5/C8KZWpnjz7eBFx+0pUe5RG0g2alX1ZsdwqM+hk/Waw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941041; c=relaxed/simple;
	bh=6LR+ts3dLqGyJz6RILMKXd4KXrMxxbWpZdEepXjEeDI=;
	h=Message-Id:Date:Mime-Version:References:To:Cc:Subject:From:
	 In-Reply-To:Content-Type; b=BlJMRq80o15hxY4tHrpJ1yiXD0P8fOwTl1i7CME+bB6Hsu/BFLFSb9CUdaCxxHmPSdVaJT0HB/KUcfwL4BdHHfFOZ0iEXFKUlqbGjvsE1b3wUwK0e6H4Rfkjd4JAtCZCMTUd/oMOLYYXAa3SZmPi3m1LQD05dgeXQ/owpj56IMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=oDQffpFU; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="oDQffpFU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941033;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8LvtcAgNW72TvNFdsfpCUs8GSOu6QxdCwl9yWGk2NyA=;
 b=oDQffpFUGnOngJv/4KXnCAh6KjQ34ioDZu82LIaqnT1mXOuaTmbBe7wl4ZCOSw4y1j9h0T
 ihU8w4wbkP7WkCTkXNpHhXsAWRnKUll12m4j7418aCuwvnDS0wT3XUhsbD3tmj83Txnd/v
 dX7ku8naXOEXPn4FEXkmm173NRh6wsgYKptmOVEbJW4nkwhTOdGV3axYpfc0jxRFDbE+gr
 f5VURMiSVmahshGcddEk/hk7D1XNcHYTnz1TO9Zkkn7omB3dD5S1X+2p0YnyKsJYaF0swg
 S1uoqxcBF3PhNbvoPNNj9I7TN7IzmzuzOFqXQyu47xNlTOnBsOP2Su/FYUasfQ==
Message-Id: <20260331071016.68302-1-sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 15:10:16 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb7367+9662e3+lists.linux.dev+sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
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
Subject: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
X-Mailer: git-send-email 2.43.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([121.34.226.213]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 15:10:30 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is based on riscv-dt-for-next.

v2:
- Patch 1:
   Use formal format user name.
- Patch 2:
   Use formal format user name.
   Add Reviewed-by from Troy Mitchell.

Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/

Sandie Cao (2):
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
