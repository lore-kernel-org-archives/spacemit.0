Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894398;
	b=UO8bbFh5j/VwgZhaF043/OouIRC6ax27FYzQqJ0B2aiT3BmImsrxhGBq3BjKygLsJGot
	 MtwaHHcu9vdmIL4Eg0yOaG1LvqK61jrt/faYOo+5h25Dp2rugpMjvyUTsmNFy/SInT96v
	 VEjcEMxBG9PtWdY2jpjeFscNbjEiGEfO1gc39jprsdpUjqziFIxcbipf4krxNpP7PtrG5
	 H0fcVyLTnUw1XFdH1ryY4Pgh4ZncuKPXgJ/R9k4CoZJxUnBIqz/vfyZJspNhDB2V2Zrm0
	 w+6DCuDDNp5OL9GPEiOa2L9KpOmWlyZiEKJ3UXlY3rWPr9D7+9tLfMTNMNSUY7zKaww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894398;
	h=DMARC-Filter:DKIM-Signature:To:X-Lms-Return-Path:X-Mailer:
	 In-Reply-To:X-Original-From:From:Date:Message-Id:Received:References:
	 Cc:Subject:Mime-Version:Content-Transfer-Encoding:Content-Type;
	bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
	b=sYEgiHAnOiOJ887w7TRT+QI8g6nuSWhomsfacXIrqxcariImuJRseCVvsYOkTwiYjbPX
	 GjCnRXFprekBb6X3pEf6PYzPoJ74qj3cOBEJ9R2kzWDapJFJmkkJwSTGbEIxr7+oiO7us
	 S2sp8Gv57/JL2eNoVqG3sFYWampEKmk3f8o7P6WQG2bHX8g75O7Mv2GEkwpV26nFLqbEt
	 FB8U/QqY8yNwjM0t3btBE2vP5Lv0RrVYng4ES3RcwmZNr1w3/GCsgNZuswAyrRXDyFpTA
	 1zoq5wE0EJwkLGXC+Z4jGlSW1X4zZLQumZa8UlBNpDVErctv8l/6NFiV+B1xBJLRRRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBA606A329
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 05:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EBA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uDg9Lnpi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894393;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=SelY6loGjDsjq7wsSeapANHBoNBqYepjvmOSjN5Go4A=;
 b=uDg9LnpiFwfrOwLppREomLJu++FN/ku190g3AyQgBNk8kBzqWlCcpa5LXAtGFOYwXVUhps
 oOfsch14OD8H1juRAOTpM6d4s9v2P6GO05odec65y3ggjhE9KxYGUlIA3T0A/TfA2S0xTv
 M/1sfsQUz1M1M64KbSGnwP6og/HVo+8Rrj6pGVbEA2fhbdf6Q6QYY28gT5FjqOfcsx2if/
 qxXYKGxUjiyR6fhUw4IZ5Cp5SNLMADPn7r1CTskANvt82lxSLqczdXuF3U35C3eqeCMj60
 PhuSaBd8AbVVIqp3NsQmL7JcpGhcIc0eme7TH6ROtT9WSZFG+gKJoleXgUltGQ==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Lms-Return-Path: <lba+26afbea37+2a1979+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:46:15 +0800
Message-Id: <20261117054615.1048836-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:46:30 +0800
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v5 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..a80d32fe6f7f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,23 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0
