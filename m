Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819549;
	b=hjQFX1zf+QsG+m2lob3lPQ7c7x/557kM9ovRFMmyWiOCTkNcgNQx0O+r88yjPMT4VXk3
	 PqN7NYXQHWZcHYE6h3z33uokxdZge+Nqs4RQibFkoLcQAZ8wSyzpjK7TH48cFhIk8vemF
	 4lyC+upgjJxZ6HOy3mDKCmzU6KbS3dJKk4KlkiV12ZGsEzVLETii8UpalkahlIf93KVYl
	 wjavkX4yc/QUlLr2dBk+2wSNEryFPop0c3Ps5JhYXfhT5+mmjv8CYCXdeL9zpUyDBoWTs
	 j4J4R7bXOIXM6PFE5BqbEfM5E98Vbs3N6hC4wFw/8oMh7uYWtL05Y9Lv4myb3eODUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819549;
	h=DMARC-Filter:DKIM-Signature:Message-Id:X-Mailer:Received:Cc:Subject:
	 Mime-Version:To:Content-Transfer-Encoding:X-Original-From:In-Reply-To:
	 X-Lms-Return-Path:Content-Type:References:Date:From;
	bh=XVGuat01xtbGFqMwwAT48i+lQJU6RP1WQYE+osx+dlk=;
	b=4k0Wk02YB/kx4N3Q0Sit7NVI/iu1OxaIHYb8M6+3RPz/Oa7eSxuz6TV9AwZV4Qb0WhXQ
	 CM+XBsnjT804o6hS/cQjAbbA7OBIXSXJ+ey0KL4i9UbU96cc6W7t8KkVxE1HQHNvIq+OR
	 ucW1r0sYaWc5VcxeQzQRrTPONEu8ESjS63eq6XMQSK9NvTUBd8hkOLAJ1/2rBr7B4CghG
	 VkYsUJBaPirUbRqALlk06OjD4CRgASUvlutDsgVQ0PbJ1klxMrW9J3U12ogxfmSRUoMHE
	 dh8ye4u3/2OQhzEH4zuhJgi2drCvYPrGzqc3j6Ybs/wEHwaKYvyLBpxAC2qhCRZsGNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=R15BR0HF;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFA606A891
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 08:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EFA606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=R15BR0HF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819534;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XVGuat01xtbGFqMwwAT48i+lQJU6RP1WQYE+osx+dlk=;
 b=R15BR0HFtk4hmy78Z49KI/+1shzMrm0eVMUcQIuJwrTEsV7qTEjt3LY767PjVu3bjaW+J0
 zfmnqkcPUQh1cNPtWiZ4kJgLYN3fENeyqjyGrJwb513AHfDdoAW9qLdqllfY3M9bq9rYbQ
 AS8Ews2c8AmeAtjXZ/GBlhCxa5kw7CKGOmaxVt6dOOiiXMSB1OUt5nu9SuJxy/nbsYgjo6
 soYd8NOB7VQB9aFLTo/b5rvpREMrVf+0cAsROx/WpiIcDOwfvcOwvUZjqmjW/krosvLdX+
 3b56oTsDrejWlLuV1si16nw7uf24qrKXhqdUELNiG02P9cc2zUm4nU7CfF+8lg==
Message-Id: <20261116085838.951269-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:58:51 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to stdout-path
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
Content-Transfer-Encoding: 7bit
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac5cc+83d4e9+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 16:58:38 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Specify the console options in stdout-path so the kernel configures the
FML13V05 debug UART (uart0) at 115200 baud, 8 data bits and no parity.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 051046fe90b2..804a9e64cf6e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -15,7 +15,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@100000000 {
-- 
2.43.0
