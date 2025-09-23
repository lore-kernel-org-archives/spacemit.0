Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96431C2FB;
	Tue, 23 Sep 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656292; cv=none; b=B7tg57gB9LuJOkwO8NMtejYf/QczTrH9pX+bDP41pZQPryGOz6JbNqv7iI2aUdtHFVfJoD5EqGCQL79fQL6rg25vf4f1d8HwwH0cgsaeZxBsAzfLYADbSj/vD1EKm8k656Soe+pzHmMjALPv0B5Kv8GWLpscZO6co9C81v1ukZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656292; c=relaxed/simple;
	bh=+L+kih9F8Y6Btvx+81DL2+/GBvUe6eeVNPeyaRY0BDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPnAjPBux1MiCkfoPmO1RNnAroHzzJ0sgZwiRCvi/MkJxd82oIaDzRCEe52I0CXwcgW6LD+xf/Y7TPKAoTFaFd9bvr6CDTPL/hx8grsr1s6xo6cLV4lhm/RjU7+uFVzdk02wyIF7n2naRSANZ4172KSOFJsGn/cZoAs4vLhYp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=FxCoqPOa; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="FxCoqPOa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=N/nltPOP/QTmAWmBxseflmrts3lUXytkbtm/LXWfigA=; b=FxCoqPOaqRZ2R8Aur6im7m1zHc
	kq0hECdk+rLeSLs6UNViB1WNIiGTwLu3YfOC4vLjWZn7L05LcE2M23DyVERkIabZYZz9rW2+fF/m/
	+xUtDVn6VzFvKxNPo3VFOQmaFYnzhWe3jWHJOWm9qDBT29YheMTLZ2bXYhekRIFnwRR8CvHZehiSv
	Y9XtxbiBcuzeta3zqFMvj5aon4sNSDaFgXhnTPUqTP4MOllot9kNbaTfz5Cdi0ATdS/is9O8g4bSY
	ltF4F4247GUGlMHnLIW+MOAL4iHVLCV5uJGOF+O3lpV/Homxbg9fy1KS3M9s8v0xq4BjLJjJDkEiM
	uSpI0+Tg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v18pu-00CB5i-20;
	Tue, 23 Sep 2025 21:38:02 +0200
Date: Tue, 23 Sep 2025 21:38:02 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNL3GnfqVGyS9AL-@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <20250922032158-GYA1291757@gentoo.org>
 <aNDVX9IrDbH2w7yJ@aurel32.net>
 <2A310AE601C62BAA+aNH7IfsDeD7-Vrxf@LT-Guozexi>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A310AE601C62BAA+aNH7IfsDeD7-Vrxf@LT-Guozexi>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Troy,

On 2025-09-23 09:42, Troy Mitchell wrote:
> On Mon, Sep 22, 2025 at 06:49:35AM +0200, Aurelien Jarno wrote:
> > On 2025-09-22 11:21, Yixun Lan wrote:
> > It seems to only contains board infos (mac addresses), but if there are 
> > other use cases, that can indeed be dropped.
> Then you can split the EEPROM into different parts.
> Each part can be described as an individual nvmem cell in the device tree.
> Some of them can be marked as read-only, while others remain writable.
> 
> Documentation/devicetree/bindings/eeprom/at24.yaml +15:
> ```
>   - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
> ```

As pointed by Vivian the best for that is to use "onie,tlv-layout". I'll 
do that in the V2.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
