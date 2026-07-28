Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F913191D3;
	Tue, 28 Jul 2026 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226151; cv=none; b=BCEghmAfBh/7x4ipHNhcB1dzGTC7B8iii1g1/V+jVUMdTkKcyVlJJ6oZrmdParppF8BynfPF9WUmKrppf2Sv/c/MywMOnSAkYNHmP1980RIGc8ikpWKtOP8qimbkl6W1mi6JH2cfnPdqmX8D9CdYgb5T0X/Nq7FzWSx2vhvfzXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226151; c=relaxed/simple;
	bh=cSUVRjOcDeoTxAVynDZptDNvQLNMpWqvy266CQiAPMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnvIYypsCvoLHqYKkSygA4PadYri1OmOIDXAHbm0krsiHXipy+T1JxOqGAyoB2xbVklm44w00JDn5mk2gi0fOR6I+zBmfbN5bbyeNC8gfTKCGqiy1qiJZHgbJnjQBhiHnTtHkDza5+6+6z81oPiEcd7uuq1tXB7hGpIxp7xZhso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npDBOj5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npDBOj5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8921F000E9;
	Tue, 28 Jul 2026 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226149;
	bh=kLUsG0cxbOOBudd9ddbSRV7/2qqz/2T6DEko4eZD+JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=npDBOj5nREIEihM99fSB/33zEtJ+Yy5WSSoqibreMFXFDTZcyr7qpYw36GAUO22ec
	 YJDJ6AgzLYiahlEMG8ZL63DYhVybsnNVX7StxXCjcm9eaY/RJfJePe6uBTgkqsyrqw
	 CiaYpqOSCFgzP8/ly7F1FidIYDfj1W5mPIj2uXBqMuLplZ/4xqh163KAB2KkaOxk49
	 5s90PPNgPkqsFHfImU3I5OXlpdh8jtWs8QpRiKmg05nSAJPaz0q4VqLlEE7kyCY9Px
	 qEGiovcVvJiPiIZdP1RMC8PX4TL2b6e8Qr6mUX099rUEJJmG2n8k0rbLHQ+Ah1uHip
	 rfHLOvqeBmPUw==
Date: Tue, 28 Jul 2026 10:09:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sterling-Ash <liangbaihui@linux.spacemit.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: gpu: img,powervr-rogue: add
 spacemit,k3-gpu
Message-ID: <20260728-chivalrous-mongrel-of-leadership-dd3bf2@quoll>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
 <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
 <20260728010513.1627950-2-liangbaihui@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728010513.1627950-2-liangbaihui@linux.spacemit.com>

On Tue, Jul 28, 2026 at 09:05:12AM +0800, Sterling-Ash wrote:
> Add a compatible string for the IMG BXM-4-64 GPU integrated into the
> SpacemiT K3 SoC. It shares the same core as thead,th1520-gpu but is
> kept as a separate compatible entry, since the K3 integration differs
> from TH1520 in its clock and power-domain requirements: K3 has a
> single "core" clock rather than three, and its GPU power domain is
> enabled by the bootloader before Linux boots rather than being
> modelled and switched by Linux, so no power-domains property is
> required for this platform (unlike the other img,img-bxm-4-64 user).
> 
> spacemit,k3-gpu is added to the existing ti,am62-gpu/ti,am62p-gpu/
> ti,j721s2-gpu "if" block that restricts clocks to a single entry,
> since K3 has the same single-clock requirement. It does not match any
> "if" block that constrains power-domains, so that property falls back
> to this schema's general constraints, where it is optional. This
> leaves room for a power-domains provider to be added later without a
> further binding change, should one ever be modelled in Linux for this
> SoC.
> 
> Signed-off-by: Sterling-Ash <liangbaihui@linux.spacemit.com>

Also, are you sure your Latin transliteration of your name includes a
hyphen? Email differs and we do not take anonymous contributions, so
this must much your name in the known identity.

Best regards,
Krzysztof

