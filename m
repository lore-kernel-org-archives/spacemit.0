Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079174;
	b=rYOHDjDkdp1k8h4Zlyc4Pb5zLJ6Hmybum0QdHfFjuXfTkrwbGjOObJJJlepr0VONQrGO
	 EafunkqxOZdjdURV8FZ/TSlIqw3C6ZH8Wj6zptCqMsj29iBuwGwdt6tbxCuvRWl5W0iDm
	 WMRSjsWKMONBmKxcLsTFDG0Vhmu+tRLM3uLdSIRi+YLKScwYwKYxWfev86L2daKsGQGLt
	 dXF0Hu+jy/4pCdvVyKXvBS4vKKdL/aKcKmkxbbIzAwy0RTg3vykv8eXDZLVK9gLfVmktH
	 s9JGjimWnVsNTRz9Lc1vCVWhA/cgWVFSgrhjBsN3+hunZds+17w+9bjPda3Vu/tU8Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079174;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:To:Content-Transfer-Encoding:
	 Content-Type:Received:Subject:Message-Id:References:Mime-Version:
	 X-Lms-Return-Path:X-Original-From:Cc:From:Date:In-Reply-To;
	bh=4HX5+/MoRFuL5friO42awFlJeeVyzzPj59afEXfj3X4=;
	b=APQtR4beTkFadvM7qNqwnOv92phjzOWF9zwg8tq0y991HzDzGaWTFMkjG1FxL7TBa2Xy
	 34/IIVUOGrjIcC7GFliSwjF8U4dCsNvgESFhlSgo9Gl5qqsqAJUg54MZx0ORiq9XMePdT
	 qiUs2Us94kzjuITA0ZTOfGjt6RQBTOpTJ/OFh89Oyt970yApm4i4c4nBtoxlknMLjFwD6
	 kAQMEq/4aKPgJTK0bvpqXTCCorKBrD9MGUAhGo0rlGWJn1p1f/UDgYGA8tHYZUkA6h+/L
	 bDD0rdQxVaihil8HZWmsk4xAIXpYSl79Gkbh9E94pLWimYtJFtvrCwAuPxll0chAK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=u7fYPe0N;
	arc=none smtp.remote-ip=209.127.231.40
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2E60A2602
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 09:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A2E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=u7fYPe0N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795079171;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4HX5+/MoRFuL5friO42awFlJeeVyzzPj59afEXfj3X4=;
 b=u7fYPe0NYEdz0UeqA0PtuIKNJrvh6xxtKCyCUnnaXvNi60Frz+ljKP9fjdfYKlhJYSHET0
 PcMaUDGOEU1vyBGIqJXoX8ZxRpvYVDvlUiyBjXWNR5Dd5EosnsxGlVENyFlq1jT76xpMVI
 UUPn0EFk1PIYANZddr4+PYzCGvVQntMkSyobfj/FFU5Ybx+YBVPjq9ERwyfL0BbVz+ayIv
 ZO3f2VElyvXt/HIsNh0fUR/sIbLHkYbqOqpdh0QHygRijspRvvB4AFNacY4upt6B4XNH6L
 Geipp2lv2JLAGts8KShdSu3JGTY7VdK5y+wn1roUIUslHVulZhy7dRiD+91tDA==
X-Mailer: git-send-email 2.43.0
To: "Conor Dooley" <conor@kernel.org>, 
	"Aurelien Jarno" <aurelien@aurel32.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:06:02 +0800
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Message-Id: <20261119090553.1886090-1-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-2-yang.wang@deepcomputing.io> <20261118-backdrop-scrap-1bee34e06336@spud> <av4iWQb33bya48G1@aurel32.net>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afebbfc+51d873+lists.linux.dev+yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
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
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-spi@vger.kernel.org>, <broonie@kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Thu, 19 Nov 2026 17:05:53 +0800
In-Reply-To: <av4iWQb33bya48G1@aurel32.net>

Hi Conor, Aurelien,

> How is this "eSPI" different to the eSPI described in fsl,espi.yaml and
> implemented by a driver in drivers/spi?

Thank you, Aurelien, for clarifying this. K3 uses the Intel-defined
eSPI interface intended to replace LPC. It is a different protocol from the
Freescale/NXP SPI controller described by fsl,espi.yaml.

On K3, the controller exposes a CPU-accessible window for the eSPI
Peripheral Channel. The EC client accesses its command, response
and memory-map regions through this window, rather than exchanging
ordinary SPI messages.

The proposed controller driver handles clocks, resets, link
configuration and window setup. The EC transport handles the EC
register mapping and host commands. The distinction is therefore
the protocol and access model, rather than the use of MMIO itself.

I will make the Intel eSPI terminology and this access model
explicit in the binding description.

Regards,
Wang Yang
