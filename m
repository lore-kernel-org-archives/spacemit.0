Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992292;
	b=bI+75xs+dJ584r3YEaBRp3GVgL/AhC9jEp1JDhSxSd0JCvjRFiyGF/Ufh0Bsxi94P1xg
	 dfiQ20/c9F+otPBZrv6t34JAnV/UrzPcOr8VvPyMFAxeqGcPwinR2NcFaXFMW+wxsCEc0
	 MVIqKQh+7x95pthGvzMqZMZ7FY8q32/xh8aOtrrIeQ2/3KF6rCEXsv/NBSvy2fIntUW1W
	 sHvEzdw4Za1nuqL/VVOLU2uFEiS/1LTQTHO46tovXvyxj7shAg9PDquEwKRnPCjQtmsCX
	 xnbFWnmZ0snnsVxUtpHbFuX0/RvO9nBDEtGt4OcEm+lod029DVphOKEIX0+usrhd55w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992292;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:
	 Content-Transfer-Encoding:References:Subject:Content-Type:From:
	 Message-Id:X-Lms-Return-Path:Received:X-Mailer:In-Reply-To:To:Cc:
	 X-Original-From;
	bh=bS3ANnO5SPstg4zhwje34jFvY6VcGhgNDUOJNHlts9g=;
	b=SLMZlO2HWZXiaZEoQUQW2quJU9AFof5Jq4SZp2Z2a9qssfDZN+eVFFfdntmvya2/H6rY
	 53JgDY56qNV7kyvf/ekO5BXJwsM2LnS9kWeGgYr9tMTI8HxTlC2D5N/IVCnFFV+SxRBE4
	 vXSdH29URT2Lclev8lpw3NdyIJgstKUZ+PqwlxiD1GKHPjbe+pOBYJVXQkUZMjCCzANyn
	 n8ywdbDuky+cFmxQnX+/clBDY81uvMiBfhXWmWiVswcnuvRtUiLHStr2yEVPs0/9iyI1N
	 i40M59OGEmXAdcjypWXo/n7M0jfEl5A293tKXgpwmfthi1Y8MoR30bdbbXwjGfD8TrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tpVjOpQi;
	arc=none smtp.remote-ip=209.127.231.46
Received: from va-2-46.ptr.blmpb.com (va-2-46.ptr.blmpb.com [209.127.231.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F2606A337
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295F2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tpVjOpQi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992286;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bS3ANnO5SPstg4zhwje34jFvY6VcGhgNDUOJNHlts9g=;
 b=tpVjOpQiH8bZsESkcUsw8yblVrpxG6Slqj9wNbXBIMW9UBJudgcCeNSxOtAPQSUaIRnmm9
 uso549gnj+Q0XOOkjLKJ70j6T7JheBT+UWjTKwrHFVQq16SBM+RHu61YnlLmbnK2hYFKSP
 TW4nsvdSH3SlrHBn6fSrHgnEhKYkU/7rWJy5VOTL1HiYy7qYgDTT01jp3UUTwl3zVEkfvJ
 NxMMRzRnzpwNSJfpmoVtTvzzB/xjyxMY+a5fnVZuJOIC+hYg8V2jOZDBtzp8CxEvPHyDzW
 +crRNFv6JHm5OFOXAu2cNK3s7mwDi8ERQ5e4lKnnb0xzNc9gSZsOWn/mhvqtIQ==
Date: Wed, 18 Nov 2026 16:57:37 +0800
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
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Subject: [PATCH 4/9] platform/chrome: Allow ChromeOS platform support on RISC-V
Content-Type: text/plain; charset=UTF-8
From: "Wang Yang" <yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-5-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd689c+233091+lists.linux.dev+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:03 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>

Expose the ChromeOS EC configuration menu on RISC-V so boards using an
EC over a supported transport can select the common protocol and input
drivers. Individual transport dependencies remain in effect.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index ca2e84420..6beda4655 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig CHROME_PLATFORMS
 	bool "Platform support for Chrome hardware"
-	depends on X86 || ARM || ARM64 || COMPILE_TEST
+	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	help
 	  Say Y here to get to see options for platform support for
-- 
2.43.0
