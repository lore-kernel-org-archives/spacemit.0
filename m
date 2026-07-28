Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08202D8378;
	Tue, 28 Jul 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226071; cv=none; b=pRxjRQVcUErephpm5nbXIh2EllpM+V76P1P50HxFM0/h3+yzBceuf993T76gB/xaEG7D8B/A82Na4YIWQCLGZTVoA3RVVGaKX6lxP/KPP11OvEwNuz9JrJxeV3yzwmIM1J7JTu5+/fh6tbKVXgSqdwJuBGiK+s8u9Z2P8gIiZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226071; c=relaxed/simple;
	bh=kvaGIAO7DhivERVQPlrFnK72ZVlxwMn2cpk2MW6Hmow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBtsK7X5m3x3DhtttKDawIPfhil6dDeZSQE8ySH3mz+vL50SbKwVmVRix+vqUYHg0gDFgLk9/suKUyDM+pqMg78Q9u8sfSB878YkNxUXUQp9Nw/G3sEzlOvC02LX0GE4nBIxeRvs3m1kjKNZnYx7jFrAMEGRB/wbYMSC9COvO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibKaJtCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibKaJtCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D17D1F00A3A;
	Tue, 28 Jul 2026 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226069;
	bh=5tUbDStS0GQHCB8UWlXzniMXPIvID1g2YNoMDc83vHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibKaJtCs/Qd5j69W9sTrfRdHt2aqYwhpM13lzbZurR679wG5biaM6HF6vj8PpT4Bl
	 7cRJEMKJG77s1/T/242kV67r1MeEfhLBT/UDmNakaOid+m123sxDa+wElTdxQ/oX/j
	 Nts9AUb2hhxPGuW7ei+eXtgeDYNf/2S2pIwL3ynlLyJN0leG4nJUzAZlZFKauXRwOJ
	 PgABLe65zTF3lDWd3YkPxz51vZistWQxkiGExxRc9fQUOHeVQxgHhWeVSIibIhyttu
	 fL+UZbnz9xk12CzKrPPTvQQfR/FcWAtuhcNf8nb1AHTatH2WN9pSHk6Z3jrlTi8Als
	 z+8EsaSs6cpHA==
Date: Tue, 28 Jul 2026 10:07:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sterling-Ash <liangbaihui@linux.spacemit.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: gpu: img,powervr-rogue: add
 spacemit,k3-gpu
Message-ID: <20260728-proud-coyote-of-happiness-e99c24@quoll>
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

I don't get this explanation. Are you explaining what the patch is doing
or explaining WHY you did this that way?

> to this schema's general constraints, where it is optional. This
> leaves room for a power-domains provider to be added later without a
> further binding change, should one ever be modelled in Linux for this
> SoC.

No, you need to provide constraints now. Please read carefully
writing-bindings.

> 
> Signed-off-by: Sterling-Ash <liangbaihui@linux.spacemit.com>
> ---

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

> v3: also add spacemit,k3-gpu to the existing ti,am62-gpu/ti,am62p-gpu/
>     ti,j721s2-gpu "if" block restricting clocks to a single entry --
>     previously it fell back to this schema's general clocks constraint
>     (1-3 items), which would have let an invalid DT with 2 or 3 clocks
>     pass validation (found by automated review on v2).
> 
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..d29f0d163b91 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -38,6 +38,11 @@ properties:
>                - thead,th1520-gpu
>            - const: img,img-bxm-4-64
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - spacemit,k3-gpu

Why isn't this part of other enum (and remember about the alphabetical
order of entries)?

Best regards,
Krzysztof

