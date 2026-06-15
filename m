Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0C37D11A
	for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505295; cv=none; b=EZbL3U9AA3PA8Fb0Cja+QEF3wiwEqbEDM5o92YD0auAUC4Dz2rZO0pVvJodqd6R1QuL37NgrR3plaAx4sVeH08LZ4qcjaQ3qVDW7XYktqra5b2/e27fdlX70oeEOW6oskeA2nvh2v8JSdrA8EDrQ09FwgTqGrHQrJlWnZhl+1Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505295; c=relaxed/simple;
	bh=S1Oly4VRINHCM1QG4R4tTGNPNvyYOvpI2d0QTuC1ElI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhP5DmHYULQUeXj43BDsqqANaJnklYJAQxn9Vf4/2nnYpNprR8SbYLueJ0VouZmXcMm1CpSNs0HxrR2gmQxna+G+hCHQXplWVmevNeeSRvDzcu0pyQbgiL5qSSKpPs+kmwu3/oRhpemdAk6cMUwTzYW5y5nLStuYjvtxGaSNR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRhD/YoP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRhD/YoP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423f236418so1544817b3a.1
        for <spacemit@lists.linux.dev>; Sun, 14 Jun 2026 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781505294; x=1782110094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=RRhD/YoPvdLluC1zGs0Lg3M5L1D3oQhrnEiqUtebC9UpkPrpf3HfO8xtlXEOodq86k
         wb9lKCLgUWRWNE02wNaC1+WRXfKr9yPWOQEKF3LwFbhxLYAKO1DjQg3NYrnAdY7x5MV4
         7FondMyqf3kmS28qhwwd5NvDsACELo3wL9Kb5YKY94hGlJehkpjZR65GZRjEpSn2DXd4
         7AvOpzlyweSYuF/2msBlJzTN7etq1+8aqr2M8hJMoZoLZCFjJBXKa5TUTPB55gW/1vsI
         ztCqX3e0BMBQgC75Qiq2u/cKYCJI3nbO+l6Ou5VvheoPAtrc7RCt8+PcH7NnhUyIw5ri
         d+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781505294; x=1782110094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=nO08iPt9ZQmI6GfwGYDFAEfeukEi+ZCKMpoyTYXWgSPmW6IcSz/P5wOiNFXZbWWs+c
         +J9QK38ISvjDvb8bIWh0xVPjOQRHuHb+9DEVH2mUe4NB3mozF3msia9LGGZVNW4+klsm
         AzXSmE9eQSKYVR2iWcIKFZdoMR10DIYxqA7THDPPU0hAvETwZUdxDYj2OrOD3syI+BIJ
         VVrj+/aP/Ug6pRGjkijhLhaPZ6RnM5k+uAioBNbxK5CaAHGvyLBv7SlXkQ96fIqEYq63
         KQc1LoCgGlAx6hPgjK4Z5S7m/kQgruaKtESKkC6pd3O1+6GjS2UvtDb9ag00u66J51bp
         wEVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wQY0/6J7pJJyFeGFcS5JGWZ86zvgPs7DdoS8CJ5g6QxEfhPccKhj5Vj96+iKXMHIl2GfRKKHS0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtcSs9BksMYQIuFAbV31E6rL9aDDJ1LcpUvI+U40f/dS7p+C5/
	4p6i1yx/4N4V+6YMKhWMKKsQsbw2i/c/pe3GMlQOttQphWGv157tAal62/r/wXjH0d8=
X-Gm-Gg: Acq92OEX/njKl8pKiE1dLKre3W63U/gCYMVKoQATj76gddm1rXYAdlCs4+h0QIvDLlo
	Dlp+hkI2iyxHexJWwk71KvgSzT07KcSxnTzDefX+8v8FJ53vvZBV2vRHnr87I9v5lfjGXKCA1/Y
	8eXw9NBMV0bH0AgdrCWQST6+xNxdE8nt+Ewcrm2fvFJYNLDJ77j9XijvZAhCT36Wq0Sa7Qj625L
	EvQJLq3swTRu9JmpowGO+vdpUvhplhBNs/hTljjZb/UJesV/ukpfB3qa1aWtWKeJ+r8lpFCj8ST
	UUKVWZNDqZ///y5EUyuP0y86cGlm782TJW8P9KtA+k5VusKh+kMQYWGjlnm+031BpFmzAFQCEUC
	/TMTcxVmKIjFh5RaJEBLdRshnD9I0aclZoI4p1P669P+/qfOmL427IUy7egafEIrzaMO4Ks0ayT
	EbX6+f+iOrhhHcISYOL+e3KCFAS8VPu1jRRQ==
X-Received: by 2002:a05:6a00:891:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-8434ce784abmr13630133b3a.30.1781505293590;
        Sun, 14 Jun 2026 23:34:53 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm9297405b3a.51.2026.06.14.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:34:52 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>

Hi Shuwei,

On 15-06-26, 14:12, Shuwei Wu wrote:
> The clusters have separate clocks, but they share the same voltage supply.[1]
> So two independent policies would be unsafe: one policy could lower the shared
> voltage while the other cluster is still running at a higher frequency.

No, both will vote for the regulator contraints using CPU device and the
regulator core will make sure it doesn't break any of them. This is what all
frameworks do, regulator, clk, etc.

> This means they can't use different policies.

This is incorrect.

> From a hardware perspective, the eight cores of the K1 are homogeneous,
> so using the same policy for them is relatively reasonable.

Right, but this is inefficient. One cluster can be idle, or in low freq mode
while other can be in higher. They MUST be two policies.

> I used a K1-specific driver because cpufreq-dt only manages one CPU clock
> through the CPU device used for the OPP transition.
> On K1, the policy needs to control two independent cluster clocks and one shared
> regulator, so the driver has to update the second cluster clock explicitly and
> keep the ordering safe: raise voltage before raising either cluster, and lower
> both cluster clocks before lowering the shared voltage.
> 
> [1] https://lore.kernel.org/spacemit/aeaXszeaE62rM6BJ@aurel32.net/

-- 
viresh
