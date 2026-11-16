Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819467;
	b=XeKexkTomTQkHETw/LfESOvyOQcO7suHTGZQV29UuH8qaQrc+EwmxoXhrQkJ3KHFdglJ
	 WxiLMOAq1WASiPdCkAlixpv1kwRZK6j6HOJHCPoOyugnrgOVyrQX0u2frTrs/WU0AuoMa
	 tg37y9w4KTd8GmKnQgkAxrnMVOjeDff3qrZiWHQMwMRbBFgPYjVQdfAq4F0ybBV92laqj
	 A6AvddLTGno3d0sg7zgo2Z2sh9BvwcEX9zo2LUh6nW2HzvozKaduiLBiWEl9h790/Nv6T
	 GNLoPUoZ1CKcRnr7BHhCINdOoTEoGaQguPRqnCOXbvjWjKyDdeyKSRWn9QQ4EZI8zPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819467;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:To:Cc:Subject:Date:
	 Message-Id:Content-Transfer-Encoding:Received:X-Lms-Return-Path:From:
	 X-Mailer:X-Original-From:Content-Type;
	bh=BTcZk/ysXO+x/psVKKTgMfCcFG9OUCtxSRwx0yIpMrg=;
	b=Kd35SeiZ0VqFukZSWVkdxF0veKMaBcWyWLNJ8qvdZKZyfB4YsU6d+Ib4zYPoXxbz+6SA
	 CX4q73XZFBB0YfQztE0rl3a4FLAykEXE62dkYJg7R+fX2Qt7vwXLNVQY+7OcC9B51Ysa4
	 6ZZH8ST8A+8uG8jUqbM/hZ1Z+GgU9MX44xwSyWxVh5k59+PLVTMNvH3JGfcwZNSltsmaA
	 n0hvd8qSd1YV+5pU7gqCVPb2vDsjFWtIr5Z0VP1D3r1N0xxt6AYXgYYhV1AQZljDrewjA
	 5+vd7XB5ClBoRuEXSSNOU7oW2YIwKT8h+Q6FXIHqABaqUSYkrhWWKwuYZ0fMuq5LGBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FXEdP6im;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A4606A31C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 08:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FXEdP6im
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819454;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=BTcZk/ysXO+x/psVKKTgMfCcFG9OUCtxSRwx0yIpMrg=;
 b=FXEdP6imxUa80WWfC+36CeHIOP2D7V8thM9xwarmZts2uMZVhoct/Y7OADD7Ck5PPr6Q3D
 xjGB8BJWSsE/W2STuHBeHXve38RtKUI7ocAohE23bUOZkFijUtPn1Y15TvFazNmhFU5gNF
 er+fPmFd8/1AQasJb0jnUzQ6e88/EoJpYcqIskOPWir1+Ng3Wv9eGbNtXVxTmiF23v+qJL
 ZP2cUgAhbGPjLr7ea2cpwU3sDYoZWSX8KwDH6kgbK5EIo4MJAQumJvMJWJWlrk5GtQWgRO
 mXIfAfBx0yIA/q/8WzdFf24ImAlgu3QYwxXs7HjJ8nROVRiFU7hqlPTpJ+0m1A==
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 0/5] riscv: dts: spacemit: enable WLAN and Bluetooth on DeepComputing FML13V05
Date: Mon, 16 Nov 2026 16:57:25 +0800
Message-Id: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:57:31 +0800
X-Lms-Return-Path: <lba+26afac57c+8bd025+lists.linux.dev+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

This series updates the DeepComputing FML13V05 device tree to describes
the console UART as 115200n8, add rfkill nodes for WLAN and Bluetooth,
model the 3.3V supply of the WLAN module, and enable PCIe node.

The series is based on next-20261113. The DeepComputing FML13V05 
device tree depends on [1]. The PCIe driver depends on[2], which 
in turn depends on [3] and [4]. The PCIe node depends on [5].

[1] https://lore.kernel.org/all/20261109033154.361399-1-sandie.cao
@deepcomputing.io/
[2] https://lore.kernel.org/all/20260929083755.458238-1-inochiama
@gmail.com/
[3] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/
drivers/pci/controller/dwc/pcie-spacemit-k1.c
[4] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama
@gmail.com/
[5] https://lore.kernel.org/spacemit/20260727094726.890179-3-inochiama
@gmail.com/
---
Sandie Cao (5):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to
    stdout-path
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    WLAN
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    Bluetooth
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power
    regulator
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)


base-commit: 4bc415760dd40fcff23deb073333984dd15d418d
-- 
2.43.0
