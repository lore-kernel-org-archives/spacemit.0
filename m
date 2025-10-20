Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396DF2A1B2
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 01:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760922056; cv=none; b=FXHF41nibh0mjjdOiydG54Brkd/ZdsdNldzGC9dHroKPNr8hdUH5gnDjzc3S1xT2ZFoNxWXB7Ua74iSsynO+NBKbLboI1sG5SLC0oaxpbH7BmEi9qp+Oq4V+OirbHYH0UrcZ91PGq45Vj3D4EiZGxgYHWOiwtTaa157IlXFGtdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760922056; c=relaxed/simple;
	bh=9P02REmymp2Kk/aoe2vYdmNmxMB7VtHTASIN4rji1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTzIsdjaVA3yr7Vmc/Iu2l6bnYgR0NxaUn6F81ILzJA8EWS447656j6QRZ9gyc3g5lKsGHCmE19llnuXW6YltMW8uz4VIDqbnJ/O7tFtd+nyGwIXpeKde13/AVB9BvR9yZXS1WzRZqSUh8yHMv5xhA/zVZdThoUy60RKYRWYm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 39512340D7F;
	Mon, 20 Oct 2025 01:00:53 +0000 (UTC)
Date: Mon, 20 Oct 2025 09:00:50 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251020010050-GYD1506524@gentoo.org>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>

Hi Michael,

On 10:02 Fri 17 Oct     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Aligning with k1-bananapi-f3.dts
> 
The DTS change looks good, but the commit message is kind of obscure
and unclear, I'd like to have an explict brief description for what
have done in the patch, without people looking at the actual DT code,
although in this case the title already says about it, but we could
still give slightly more info/context:

The OrangePi RV2 board ships two RGMII ethernet ports with each
has an external Motorcomm YT8531C PHY attached, the PHY use gpio
for the reset pin control.

Enable PDMA for OrangePi RV2 board which provided by SpacemiT K1-based SoC.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

-- 
Yixun Lan (dlan)
