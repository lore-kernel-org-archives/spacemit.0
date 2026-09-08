Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534619F115
	for <spacemit@lists.linux.dev>; Tue,  8 Sep 2026 04:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842540; cv=none; b=F+QLV+lftKM15V8u80zNDJpieMffH0gITD8YzWvVYnwX8FWH2KJ62RFBtaRtGoATfWgzVW+SBDFUoGoOpfNJWAX5zMQ1LnOQmeBDNaHC3PHaft6lXvOnxv1Xe2YoTLdfD3Fo92fjGpAoNWZ+Oq0hYW+xO8i05jYBRXqDaSicFRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842540; c=relaxed/simple;
	bh=x6kQx25IJwgp05TqroMqPHrWpz0ht9yREBOZISt2VuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ4UAR+X3oWcFF8df8g5RaQvyX9thjr201ClYFhCYD5sc7w2NQ+YwExCNRii6K3uInEl0XBDyRD5AGwVRy+2ypx/KpnCd7JGn/4+Yc93+PiD97+itcUY4aHK8VTz+rQhukV6Az4QcmGpdtxckfCcTNKIENYYiknIjdjVQHfpBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=drlqnM6M; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="drlqnM6M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=pJTC0xXNuB6/FR3SFnQD89wasUY2SzDpeY/IZfDA5kY=; b=drlqnM6MJd1QipihzHmVJOJRhK
	RGMPHGb7pK+htvEo71E5ODyA2DmlsQ6c4159CLGxIKE1pzapMO6MQcUieiavXiZ+S6tSK6xKnOMxE
	Sz+NC/zU/a3NdoNDHrb+3p4EGW7Tx/85zkHWb5TIyyMEDrnplXrF9e3b09qPCSZkg43FSBEWjax8G
	baHMDvzObQiP/tVxB9+JbR6M8+YECbHgRMLUREkv0Z6vVqzXslvhLFVAv08h0zws8M26wg4C8OAFG
	ECnSvQdyA8Ld7qzVpSTCNxKIsT35avz0BbFjJix6hhVTHrTcHKFWHEj6IPdhGIu0AsQZXAFV43xAP
	CTw/HkJg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x3nes-0000000423P-0ynJ;
	Tue, 08 Sep 2026 06:42:10 +0200
Date: Tue, 8 Sep 2026 06:42:09 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 with RVV
Message-ID: <ap-SIQ9DLt-CfAx6@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <apSYF5x1Tu7PlyL1@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)

Dear all,

I have done some small progress on that issue. Help is still wanted and=20
would be appreciated.

On 2026-08-30 22:52, Aurelien Jarno wrote:
> Dear all,
>=20
> For the last weeks, I have been tracking a random memory corruption and
> relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It=20
> started upgrading to glibc 2.43, which does memset() through vector=20
> instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1=20
> kernel, but I have also been able to reproduce it with a vanilla 7.2.2=20
> kernel, using a similar configuration to the Debian kernel. The board=20
> uses OpenSBI 1.9 and the vendor U-Boot.

I have been able to rule out OpenSBI from the issue, I have checked=20
there is not trap top OpenSBI when the problem happens.

> Typically it manifests itself with the following kind of error, when=20
> running g++ from GCC 16 as part of building software (e.g. OpenJDK,=20
> Blender, Dolfin, Qt6):  =20
>=20
> Assembler messages:
> {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> {standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=C3=BF=
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
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'
>=20
> The broken chars are 0xff and it seems there are always 240 (but with=20
> poor statistics). Sometimes it instead causes a GCC ICE instead.

I have identified that the 0xff comes from the poisoning done for v0 in
__riscv_v_vstate_discard(), which should only happen for a syscall.=20
Indeed changing the value to different ones propagates to the above=20
error message.

Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE=20
doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD=20
changes the number of broken bytes.

Disabling the vectored user code entirely with the following patch seems
to prevent the issue (or make it sufficiently rare that I have not=20
encountered it):

--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -25,7 +25,7 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src=
, size_t n,
        size_t remain, copied;
=20
        /* skip has_vector() check because it has been done by the asm  */
-       if (!may_use_simd())
+       if (!may_use_simd() || true)
                goto fallback;
=20
        kernel_vector_begin();

Overall, while the corruption happens randomly, the corruption itself=20
seems to be deterministic, and the data source of the corruption is=20
identified. But I don't understand how those values propagate to user=20
space. It is not clear to me if it is a bug somewhere in the context=20
switching code, or a bug in __asm_vector_usercopy_sum_enabled fixup=20
code, with the values just being the one at the entry of the function.
Also I can't completely rule out a CPU bug.

> Using glibc 2.44 instead of glibc 2.43, which does a lot of string=20
> operations through vector instructions, increases the probability to=20
> have corruption, makes it a bit more reproducible, but it always seems=20
> to manifest as a GCC ICE. It typically happens withing one hour when=20
> running on the 8 cores instead of every 1 or 2 days. From there I have=20
> been able to determine the following things:

I have stopped using glibc 2.44 as a reproducer, and it generate=20
different type of crashes, and there could be another set of bugs on top=20
of the one I am trying to identify. This however means it takes a lot of=20
time to test any change.
=20
> - Disabling vector instructions (by patching the DTB to remove "v",=20
>   "zvhf" and "zvtk") fixes the issue
>=20
> - Disabling THP (by setting /sys/kernel/mm/transparent_hugepage/enabled=
=20
>   to never instead of always) also seems to fix the issue. Keeping it=20
>   enabled with defrag=3Dnever or use_zero_page=3D0 doesn't change anythin=
g.

I don't think this is a good direction, my impression is that it just=20
changes timing a bit, which just hide the issue, or require different=20
condition to trigger it.

Regards
Aurelien=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
