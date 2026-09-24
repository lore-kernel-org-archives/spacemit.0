Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526F3E5EDB
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225547; cv=none; b=rqodwqwvdjChKivrwPUwDpEA6Rjz+UI1EHvbFnsZpEYqVB5QMvDv38Uxe07wI5UYzWfJpTfRxBmVkBbBx3jBB6B7a8N9knk30aadMSkhdZwJf+9n52PtPSTyXw35dQVyxWRq1erU10el2HkI7VPKssSXVgQ/I+NYSKTgcWVns48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225547; c=relaxed/simple;
	bh=Sm7rxm9F59RolhH/a1WLNbmEdD9CcgKjDn3oyDUbc1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl8/4ohHB6faYSxroBuGhBjsDiw3xG6Rr40UXVzCLOkizs7eSrYMyYcySElLAb4FcgjxBpJYFqGoZanVkjwu28vt5tKrFHatohIcT/lnJgeQH4KF7o+cXtZWR4c2aUJcrVfXAhTlaOPKnFM6wpn1Flz0jWMgPK/GhvTDKSRsNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Z9qqdwHr; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Z9qqdwHr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=A1FDhp6qEnhVheCdkCeYR2VOVfYNNI9vtB0izgIO5b8=; b=Z9qqdwHru7CVYd9khdvB3J5Gjd
	fcNlwbcCYSmDLQrHH99L6g7J5MMskmlQ8I6ewsnvFqdISHrf291ZBjYMIgMOA+REBLBgKcm/fiuDf
	7lBK3D2fWxmFUEwxM2dx0QrW8sG+kqv5jo8XRFt1vZVVDMh7P4ljFxhbmOuWaIySMtWdTZurD0WLz
	Vq174oJ5z4Wb1DX5r9Bq6cjiXb7S/7k/6Lrhj5zoYkdiLIUcqRXIH9DohSx1prDCexIEDJD1ftkQl
	KaPH/uWYAOi3QraNrtJdJMVrVCaxhqm1+nCfOVgiCHfePM3yN5Cfq/Lhjhq1cw31IVwktaeSDPMxb
	mCpVsM1Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9bRW-00000008K5r-0akf;
	Thu, 24 Sep 2026 06:52:22 +0200
Date: Thu, 24 Sep 2026 06:52:21 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arSshYwcyHjC2dh3@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Andy,

On 2026-09-22 16:33, Andy Chiu wrote:
> Hi Aurelien,
>=20
> Sorry for replying late. I did run a compilation test with vectorized
> glibc in qemu after seeing this thread shortly, but then focus on
> something else as it didn't catch any corruption we've seen here.

Thanks for your feedback. Note that at this stage I have not been able=20
to reproduce the issue with QEMU. I guess it's very timing dependent,=20
also I am not sure if QEMU simulates partially executed instructions=20
(outside of page faults).

> On Wed, Sep 09, 2026 at 06:45:14PM +0200, Aurelien Jarno wrote:
> > [Added Andy and Karl in Cc: as they have been involved in the vectored=
=20
> > user copy code and fighting similar issues]
> >=20
> > Hi,
> >=20
> > Some more progress on that topic.
> >=20
> > On 2026-09-08 06:42, Aurelien Jarno wrote:
> > > Dear all,
> > >=20
> > > I have done some small progress on that issue. Help is still wanted a=
nd=20
> > > would be appreciated.
> > >=20
> > > On 2026-08-30 22:52, Aurelien Jarno wrote:
> > > > Dear all,
> > > >=20
> > > > For the last weeks, I have been tracking a random memory corruption=
 and
> > > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). I=
t=20
> > > > started upgrading to glibc 2.43, which does memset() through vector=
=20
> > > > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1=
=20
> > > > kernel, but I have also been able to reproduce it with a vanilla 7.=
2.2=20
> > > > kernel, using a similar configuration to the Debian kernel. The boa=
rd=20
> > > > uses OpenSBI 1.9 and the vendor U-Boot.
>=20
> The KVM fix, which is in 7.3 now, is irrelavant to this bug (see below),
> because the fix targets preemptible kernel-mode vector, but we can
> trigger this bug with CONFIG_RISCV_ISA_V_PREEMPTIVE unset. Nontheless,
> if we want to test on the latest code, feel free to grab the series at
> [3] and boot with riscv_novstateopt to preseve the context poisoning
> behavior.

Thanks, I'll try that.

> > >=20
> > > I have been able to rule out OpenSBI from the issue, I have checked=
=20
> > > there is not trap top OpenSBI when the problem happens.
> > >=20
> > > > Typically it manifests itself with the following kind of error, whe=
n=20
> > > > running g++ from GCC 16 as part of building software (e.g. OpenJDK,=
=20
> > > > Blender, Dolfin, Qt6):  =20
> > > >=20
> > > > Assembler messages:
> > > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > > > {standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'
> > > >=20
> > > > The broken chars are 0xff and it seems there are always 240 (but wi=
th=20
> > > > poor statistics). Sometimes it instead causes a GCC ICE instead.
> > >=20
> > > I have identified that the 0xff comes from the poisoning done for v0 =
in
> > > __riscv_v_vstate_discard(), which should only happen for a syscall.=
=20
> > > Indeed changing the value to different ones propagates to the above=
=20
> > > error message.
> > >=20
> > > Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE=
=20
> > > doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOL=
D=20
> > > changes the number of broken bytes.
>=20
> Turnning off CONFIG_RISCV_ISA_V_PREEMPTIVE makes the ucopy fall back to
> the scalar copy on a page fault, because faulthandler_disabled() would
> return true after kernel_vector_begin(). So if we are suspecting a
> corruption at vector restart, then it is not, there is no restarting of
> such instruction.
>=20
> The only possible way to have a restarted vector ld/st here under
> !CONFIG_RISCV_ISA_V_PREEMPTIVE is then an irq restart. I don't know if
> you test this code with !CONFIG_RISCV_ISA_V_PREEMPTIVE **and** with
> irqs_disabled() =3D=3D true in the user copy code. If we still observed
> a corruption under this case, then it suggests that the corruption
> happens even eariler. It is then either the faulting instruction itself,
> or the corruption happens even eariler.

I have already tried with both CONFIG_RISCV_ISA_V_PREEMPTIVE=3Dn and=20
wrapping the vectored user copy call in between local_irq_save(flags)=20
and local_irq_restore(flags). The problem is still reproducible.

I have also tried to instrument the vectored user copy code by saving=20
the insret crs before and after the vle8.v instruction to detect a=20
possible interrupted instruction (as suggested on IRC), but adding this=20
code seems to have "fixed" the issue.

> > The values from __riscv_v_vstate_discard() end-up there because they ar=
e=20
> > the last values written to the vector registers. I have added some=20
> > poisoning in __asm_vector_usercopy_sum_enabled before the loop, and=20
> > those values appear instead. Using different values per vector register=
,=20
>=20
> Do you know what is the address of corrupted data? If it always starts at
> a page boundary (e.g offset 0x00000 for THP) then it suggests a strong
> correlation with fault handling.

On the K1, for the few cases I captured, none of them involved 4k page=20
crossing on either source or destination. The only invariant I have=20
found is that for some reason the first iteration of the loop only=20
loads 16 bytes, and write 256 bytes. The second iteration of the loop=20
then goes to the load fixup and exits.

On the K3, I have never observed a corruption at the vector user copy,=20
but I still observed rare memory corruptions causing gcc to crash, and=20
which disappeared when disabling vector instructions at the device tree
level, like on the K1. But that could be two different issues linked to=20
vector instructions.

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
