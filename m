Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D248175A66;
	Sat, 30 May 2026 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110080; cv=none; b=UOG5WCE1o2H+kwIbA7CjFuRHEOhUZG0PZ6z22tOdcUQV/eiHtAo/B5VscK41F0VIOW5hzfEmDFliVrCtdiaULXa+wnM+NebCjbHtvd0o5bfKMnTTT2waAhnZT6UUlBOVvhgc7rwxdnYcUcSntXM60avOeY1zfMKd+4LVMIXG9bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110080; c=relaxed/simple;
	bh=N2mbvpTjxtMUi5qCtiEBcDM9f1G+u7J48/3ZUvw3M0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twNYJBC998BtC8gqP0kx4MyN3IPl2/weW7lElbNWEAiEk/O4ZgP8DkezTS1gefA/Hvsm45IMS5Gbr/cJBhztZfDuN/SrcWj0YB1xmBDdI0IMkabg2LqnycFcOkdpfmmUa+G8dFanK+lHBneGNpuaYhw8dWijn35IdGjfltB0JSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzXuzZ6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzXuzZ6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB681F00893;
	Sat, 30 May 2026 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110079;
	bh=56mC+ARUUx2aYOmcTLesen9tO/BpwtjQ6jTLU/506+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mzXuzZ6tb8Gh852fD+LHOO94PoVBppboU/C2ewhWqRuhvbDF2/WTpTHKtPKupaWUN
	 ISdKZqN0JaPZjCGcC4KWOKL7E2+lIs4Yr3EpeFh3tY+0ln9ft8KgDv/LAdY79ylE1Z
	 HmkqPgK6fjDmVvdVv1/g9v5vYhe4Pe51R0as7NN5rgNIglbbpY/itM13XRpMlWvZ09
	 +8cDleg9KlBmCf9hcX1me54lmxqGO+c+p/cPXcLueGHemDk93JRtC1OuUuGK9xOAb+
	 kXhhtCr5ltq9H7KnFYQI+90WeDd68GtmE8r70oku8pAdD/NJz2ncKEQsfx0THbW9/K
	 Q+eZ2ASlISsxw==
Date: Sat, 30 May 2026 03:01:17 +0000
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
Message-ID: <20260530030117-GKF3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
 <20260529062159-GKE3748271@kernel.org>
 <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>

Hi Guodong,

On 21:22 Fri 29 May     , Guodong Xu wrote:
> Hi, Yixun
.. 
> 
> Correct. Thanks for double-checking.
> 
> In the above test, CONFIG_RISCV_TICKET_SPINLOCKS was not enabled.
> And since X100 has neither Zabha nor Zacas, the runtime selection in
> riscv_spinlock_init() falls through to the Ziccrse branch.
> 
great, that's what I'd like to check , thanks for confirmation
-- 
Yixun Lan (dlan)
