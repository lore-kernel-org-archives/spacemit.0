Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F436C581
	for <spacemit@lists.linux.dev>; Thu, 30 Jul 2026 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379232; cv=none; b=EMz0fHsEPCe7AVSq6IdaRjOuAasLXCHvoJVOJvrIs8PEcMKcsIRMZd1iRqZYlXHBXc7GoDJMStsZO7KnQz4ydgmMOW+lCeoMbJfC0KJrP7E3LCtoHDBXPujoCBzQwaIaMQuY2qAlWr6RlJhZa/+bMmIqEsWKdrlfnqzeq2SDw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379232; c=relaxed/simple;
	bh=6G4Xma+nHyY7H4SK8n91Do8E6lFjpiFxFrum0hOvvVo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Z9KC4LRNZtPhfnFOMMB6UZqrLje6zq2mPg7HjMnH5qDoxY/Wt/P2Jcz6PPbNxPIzpvBhLSK7ldpL8QwGSGmL3P4Ce/aZqYhT9t0dfvvJ7op202TWcCF6BKs8aq4CroaSZxSf/5omrx+pusxDqFMxquii2OCxAsmw440jwGErVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VAV1Wozj; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VAV1Wozj"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785379227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5B2ge7eLjQjPjb19+CHal8Uxkv+UmEOOCeLjm8fv4Ac=;
	b=VAV1Wozjjbctt9UIbsrw6lWTDArWr2lROWoB6yGPbEY3OAPKi7jY3Hm4QDpoj0ezssOa9b
	x8y4w5g4hv4fGXvuuY7dIe1+gRNg9C+PePCodCFtDN4YtlA2D9SPeQFhy1LF1jOP5/7H5H
	y4Gf2OblrZcF+GSyPNTIt5j11WHC2SU=
Content-Type: multipart/signed;
 boundary=554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 29 Jul 2026 19:40:19 -0700
Message-Id: <DKBK42KDTZXZ.18MO9G0R9L8B9@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell" <troy.mitchell@linux.dev>,
 "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
In-Reply-To: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-Migadu-Flow: FLOW_OUT

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Mar 30, 2026 at 2:58 AM PDT, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.dev>
>
> Currently, the RISC-V implementation of machine_restart(), machine_halt()=
,
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
>
> This implementation fails to provide a deterministic execution environmen=
t
> for registered handlers in the restart or power-off notifier chains. Thes=
e
> chains are intended to be executed in a strict atomic and single-threaded
> context.
>
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not incremen=
t
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentificat=
ion
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
>
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
>
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Hi Paul,

A gentle ping on this patch. When you have a chance, could you please
take a look and let me know whether this approach looks reasonable?

                                    - Troy

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCamq5kyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/WUAEAo/Ayg3TKHBDa
h9ruUla/m+yRTaS8PyNF80vaN+vWPBsA/3qm/T+HOqlqDGPdwk5MY23wPc7amVyX
g6ursIB/U4kO
=1YnG
-----END PGP SIGNATURE-----

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f--
