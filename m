Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819596;
	b=j99pJSMz21erzpEajeAzXyhaU4FIwfhwitrV60pl+6uFzAAOIVA+hY9WFSR8lbwZnAe8
	 Y2hOxItpQSZRS7keX10WJBdvQFg5Gosx1x3uDcLdniMjqP6wiVRfJ2C+u6lXClMyczeGW
	 xbGt9CmTpTDfua1WuCbebxuyLjcCOoemt9XFezwvlhkCKNKiZTXgDhjwhqo9zjFOK1R5u
	 SpvKb+tEshKXyE4Vl8Ya225bmsXgGq2P9gnYd31eEbgLjNFgrLw83HF8WoCgTQ1HRJQ/i
	 koQRP15S32CIqPro5Md6um7AgQvZZ1lsYsuqNQTsUnUybwRkpIECmC+0Demc1rPsKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819596;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:Mime-Version:X-Mailer:
	 X-Lms-Return-Path:To:From:Subject:Content-Transfer-Encoding:
	 X-Original-From:Cc:Received:References:Content-Type:In-Reply-To;
	bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
	b=enrZyhuVROBmIRoTOHMxAgwwt5PkRRwdGwpyyaDpmb41xeGEodhrElYYFnTwO6exB8mB
	 RT0mN9EsWItIWbTZtp8HvFURUnioTzuQ8P41YR9lUeVbQSFZJ0o12CLI88Lg5cDKzT35p
	 bcF6obf8PADFdN9lYDpnZVRrTgJ89qpI9h93cHPluJz9BBkNLZa4kNDBdPOwjWrY4KfNf
	 gO/U0gQ9+9OlUdyign0XXJ3ZGH+/gYlwRLMtWR/dWtCVzxXcs0OMjd0N5trPrwXxfz8+T
	 xwVlaxHerXaDvIIkASbfaqkjzOIEIOY2zfXO4gtQT0MWjS6mQ5cMijfmw38f4F3anrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=chnuYcrT;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4441606A31C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 08:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4441606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=chnuYcrT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819586;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
 b=chnuYcrTLNHOZiceXRlAhlXo8XKVWrINlE5cXC6ySQhXNsabtwXvS38AfDUbnOGQQMFI6P
 3n7gsnJ6qw4bUU+reYEANL1/0gOrqoCk2l/lSHba2RyX+TwkYpMol2IabgYW0RkVRUDv3P
 oAZ50ZR29BAgzvS5DnpiPIIGqRPmJxm9LbFccdK8ZU+6VwMhgSFIWDxfxsUNcnuQpML4vm
 SAUawCQ5ce1j1yFkLXs8SIORrTOZmv71RsV8sDSsncXkUCWENMe98D+5Rnj0ayK+KKi7Jf
 TVPMLQA9BckF5IZyXXXwkwW4dMtK7YLSbZ4QhH4JFmgCJna6PuwFexhld/b9ng==
Date: Mon, 16 Nov 2026 16:59:30 +0800
Message-Id: <20261116085930.951304-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26afac5fc+80f4f3+lists.linux.dev+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for Bluetooth
Content-Transfer-Encoding: 7bit
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:39 +0800
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>

Expose the Bluetooth enable signal of the FML13V05 as an rfkill-gpio
device so the Bluetooth driver or userspace can toggle it, following
the K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index f84225cda1e9..8c12fd01227b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -37,6 +37,13 @@ rfkill-pcie-wlan {
 		radio-type = "wlan";
 		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
