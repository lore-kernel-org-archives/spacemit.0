Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850A221DAE;
	Sat, 16 May 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778939165; cv=none; b=puLjy4t70HzrePKwEjGUJI67lH9hJSxL9fd1Xfb549pLq6RjVXH7/h4cyO++E4If589W3YYheRSgbLqr1e3aJpe9GFBDe0S2SQEf4B8vGpbjRGP6XPsMAHONriv/WHxnvuKU6vwcF8T7VGjK1gWxccGHAi8LHiyLPNWwr4XMZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778939165; c=relaxed/simple;
	bh=GKVZ5j8qjqsmJoXt0a6b/BD/gTotnEQVA0nYLIeU1As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWpLHz7WcxC7VYcBtH1z3NSAO9cM/R+AaWmwZ6vf0B1fpn0hM/Ats7e2ex6CxK2zuP9R6S14Xg29zCfB5lPRFNqA/sTGSwHK5+GVMHtH6WzXB63Nv44ZkeNdz3LXvZBt51bazR7fIbOU84BJ//PejYxirujMOP24/wg/DJ1W3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qe11BBIL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qe11BBIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AB4C19425;
	Sat, 16 May 2026 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778939164;
	bh=GKVZ5j8qjqsmJoXt0a6b/BD/gTotnEQVA0nYLIeU1As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qe11BBILvcIILjPyGrdWN/A8LunHdzZzpiu+AKAxhcpjqALpHa/2I9fQTUPBcxXTK
	 KsKCbjW8wRCrW/RGjKmpSHpK1mRPGSHxQP5OTTgFz77qnBZMOr9nySygg2111sBr+F
	 xSb67ItgeIHPCQGvJZAMUSmY64c8s0FP0UXDsXDRICnbrtF4F+ujm4rWMByhjk+78P
	 K8qTtBvWkiEsK+ilmYPu/WRwFfaCS8ptiztDm0rcl64+X6GxLXPJVd8txPVbmLlGaC
	 70CipjXOp8uNAaTD6KDJyjoZ6oUyUm+MtQBP+O5nOHmuepcPnxNDzg/4PIPnJyvLGd
	 GxXoe9SUu0YpA==
Date: Sat, 16 May 2026 13:46:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi R2S
Message-ID: <20260516134602-GKA3679294@kernel.org>
References: <20260511070718-GKC3624147@kernel.org>
 <20260513060030.616473-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513060030.616473-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 14:00 Wed 13 May     , Chukun Pan wrote:
> Hi,
> 
> > please check my comment below, I think this patch has similar issue
> >
> > https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/
> 
> I don't think this is an issue. Otherwise, these commits need to be fixed:
> https://github.com/torvalds/linux/commit/1df07a40453fd652132051419140950d47941fe9
> https://github.com/torvalds/linux/commit/ae9d03f8aec76c1bff21083b67c211238d7c57b1
> 
I agree, these patch was introduced before we learned the convention from
DT maintainer, got no comment in that review phase, so it just slip in

so yes, we should fix it, and patches are welcome..

> Let's confirm the current DT preferred:
> 
> - regulator-fixed
> 
>   nodename: Preferred name is 'regulator-[0-9]v[0-9]'
> 
>   gpio/gpios: Preferred 'gpios'
>   https://github.com/torvalds/linux/commit/12df2c182ccb850988d2680a422211a812fb5cb2
> 
> There is no specification or preference stating that regulators without
> software or GPIO control should be removed.
Not exactly, if some device driver explicitly request regulator, then
fixed regulators without software or GPIO control are still needed

Please refer to this reply from Krzysztof, fixed, non-controllable regulator isn't
really necessary if no driver/device used, will only waste memory, slow down boot time..
https://lore.kernel.org/all/90eafe45-7863-4c1d-b1e5-55a4fe32c806@kernel.org/

In this patch, I think both vcc_5v0 and vcc4v0 can be removed

> 
> This has been discussed many times, and people are used to describing DT
> according to the schematic:
> https://lore.kernel.org/all/44ba02e34d7bf6a6657894802a87b690@manjaro.org/
> 
For Dragan Simic's reply, I see no ACK from DT maintainer

> Therefore, if you consider these regulators unacceptable, we should remove
> them from other dts in spacemit, or allow such changes.
> 
I would prefer to remove it, see comments above

> Thanks,
> Chukun

-- 
Yixun Lan (dlan)
