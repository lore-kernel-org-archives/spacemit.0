Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081235;
	b=RvWpgQkFhZ7/jZCzHWnTR5Ph9dK4/fXKkAVosMEUUzLmqPija80/33vg8lBlY1NYxvsp
	 tIFbdF2EPaI1EoZxib2/bHUAzvaH1G7dfwO0eBkSQQNSs+oXF+gub/D7SFFnlH8zrSjZu
	 okI6S/Ok6vfsevePGA7IHR70fIHVd7u1ld6pAHWKiBB9asb8sWmoyMgbGAG7q1mp5kZWs
	 T7ZMHMOdeGQHdUKnisK4D4u918D7WaziaisASmYR6iV9Yn8Mx2VhRTDTPZnv1LeX3g2Sz
	 sSmVfxUKwhUM7HuVP9J4/Hcd+ynaYmSm7P0xC89dDMDqmqnUU1HocyfJWp9M6vjNmSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081235;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Content-Type:X-Lms-Return-Path:
	 Content-Transfer-Encoding:References:To:Date:Message-Id:Subject:
	 Mime-Version:Received:X-Original-From:X-Mailer:In-Reply-To;
	bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
	b=3u0UZ0m5Tdx87t0jYFVwg/Ly72wnsyxYbsw5pNJ5dDxEXocNK3WGJNvH75idg/roGRq1
	 4Pi6E2Vy7OA+loLFfdSeW3eYIWufEZfzgLejaXyfUJmll93pmVZijte7GI9Mdi9VIrAw8
	 rSFCUAx0BV9UlTSDoSQGmvb+IjFfhh7EdZCTEzXwfZvgrcdRGmssvnHe/fd1x5zdrKUWK
	 T16Sl9lEckZTsVx6aje1HfSfNc+hychCle/AbNZhbPTuvKgRiJAMBQDMZRD5pY/MMWH5D
	 wx2CA8+XShwr4wZn4FUmOIeQ8pvqmbTm6PE/9DT3Hs3oNitY3yOM1k2L1XTrwEKubWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B76606A324
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 09:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B76606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795081230;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
 b=rMj0eB1NfVtEKTaQ++TCwT67NBWyuEc8bCg33V2kewYMsFGXFrT/NSNF3PvgoLia7Ent9G
 X7LRyIAEsHtzsQWcD1vjFe74VqApVjuYjPbuUXdk2fQ+7YpCGgeeK0YD+/C3a23T44eE+y
 NQCGUoZInrtaFRL5g0pJ962hSDMZk/DMQGZrV5iGKcPbdXi4Q4vdcNhfkcXJBUThmg8+WF
 +XvT8PUsu3XMUEVsbpkrK84zpE4msLqIvIIPHRhOTKtYqaxHt8A8kNgz6iWxvVAUHZCwn+
 rkHNaWYFNKgoyxsspQm+vw54S3LV2U60yHzflwPHuuNqftbAs1VJDjJLdsoUYA==
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26afec40c+e20e66+lists.linux.dev+yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-4-yang.wang@deepcomputing.io> <av4UUyCtDBJNU0h5@aurel32.net>
To: "Aurelien Jarno" <aurelien@aurel32.net>
Date: Thu, 19 Nov 2026 17:40:20 +0800
Message-Id: <20261119094020.1888153-1-yang.wang@deepcomputing.io>
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:40:27 +0800
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <av4UUyCtDBJNU0h5@aurel32.net>

Hi Aurelien,

Thank you for pointing out the AMD RFC. I missed it during the
initial search.

I have now looked through the RFC and its follow-up discussion.
I am still checking how K3's CPU-mapped Peripheral Channel window,
device enumeration and link recovery could fit into that framework.
I will take this work into account before posting the next revision.

Thanks also for pointing out the EC on SpacemiT's K3 Pico-ITX
development board. I understand that its EC uses the same eSPI
hardware interface as the EC on FML13V05. Keeping the controller
separate from the EC transport should allow the support to be
shared between the two boards. My validation so far has been
limited to FML13V05.

Regards,
Wang Yang
