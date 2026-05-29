Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA935203F;
	Fri, 29 May 2026 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780035724; cv=none; b=u9cCIdDVwxWW8Xa88D9bZptAIXSCsKxszy220fp6mWMIqFGgX8uRTdogo5tISAZ3i9j/BHbb9uNMP1XQsHY4uKQ+DXY17HPSSCJ1rhMztr+Fd416qOqcOgJ8dLT0QeAC8MRtDaZi/FLCvXxHo1s7vtWUbMzUixVDzvwYolfO8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780035724; c=relaxed/simple;
	bh=+2+Y4oomqI8eMypF0HLbi7JlxEucJqoizNkMyJhbt2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAXrfqE7himRMH70ZsfUkoiQXImqTOPq0PwDvn5r7AiNAmuAGQGtQUIatl77J0XRfQLRQ5/ALpHr8JX27Ael6pjsjbjoQntxpsdARIzO2LI7j977TfNr6SXqKT0aYKYtf+uPx5u724CPArJnjPlSF7vaSqA61hjrGBPoP9nYsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0lKK5np; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0lKK5np"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7161F00893;
	Fri, 29 May 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780035722;
	bh=XNhOvejT4/3o+g58bTyobWWwZwSRbAllSV42yEUrEQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P0lKK5npMrRB+m7LsnGng8LuC9nAiFxO5ZTK86uuvAGRSH+W5l8naXQSEAVOugJNd
	 2dA77UQlpqDbKbjcSyFi45HlT0XKuAqeIHcdpQ1KGS4YmbLAXyMiYmdgfU73DOjIYE
	 iHQFC06Nw6U61DDHp8B69BHn37wpry63zND8HsD3TIQ27IRhvmjKybKSOj0+CMO4+3
	 j/DzusFAPSAVDXWQ4GnlS0UTRyXBVCK1D7DzzlsjPP2gmIlXdDBwwWMiuvNYeTq0u5
	 G4JyGM8w8MgQ2JM17piyh+ZIPwzgGqI9NtTDnnSsScfa8trhCpWwYjD1XIMAKmxZbk
	 xLUs0FC1IpwNw==
Date: Fri, 29 May 2026 06:21:59 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Message-ID: <20260529062159-GKE3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>

Hi Guodong,

On 13:18 Thu 28 May     , Guodong Xu wrote:
> On Tue, May 26, 2026 at 3:23 PM Guodong Xu <guodong@riscstar.com> wrote:
> >
> > Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> > provides a forward progress guarantee on LR/SC sequences in main
> > memory regions with cacheability and coherence PMAs.
> >
> > The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> > specification.
> 
> For the record, I have tested this change on SpacemiT K3 Pico-ITX.
> 
> The stress test is run by enabling CONFIG_LOCK_TORTURE_TEST=y then
> boots the kernel with:
> 
>   locktorture.torture_type=spin_lock locktorture.nwriters_stress=16
> 
> driving all 8 harts. It survived sustained torture [ran for ~10 minutes]
> with 0 Fail.
> 
> ... ...
> [  735.588947] torture_spin_lock_write_delay: delay = 25 jiffies.
> [  738.015096] torture_spin_lock_write_delay: delay = 25 jiffies.
> [  739.204713] torture_spin_lock_write_delay: delay = 25 jiffies.
> [  741.195211] Writes:  Total: 714319420  Max/Min: 45946599/43679876   Fail: 0
> 
I appreciate you give more info about the test, just want to make sure,
for the kernel config, the CONFIG_RISCV_TICKET_SPINLOCKS is not enabled?
so it will fall back to use ziccrse implementation..
-- 
Yixun Lan (dlan)
