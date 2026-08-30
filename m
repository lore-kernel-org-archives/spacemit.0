Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153070808
	for <spacemit@lists.linux.dev>; Sun, 30 Aug 2026 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123164; cv=none; b=cFMMG0sCRBUHAQIDtr6QcpiKSm94YExeh27sjseiEY+Bwd4Nc1f9ficSgR6w3PcKufbdkr37fZdbFkZJnLyImYt0HaC8THv1HFGGpi25KWaGx814TMtGJT8Ai1BKF2rWnhUr6C7ZEivdnaVzCaiWNlePmA/Z7GvjG/ofD1fe0Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123164; c=relaxed/simple;
	bh=FalA2fp8jhv2fXljyw3CNW6Wz6zMReGGgxbJJZiT4bM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krOy0jLtaXdiTFvmXMJoiWJykBcthL+VvSOnpd3sSFY/g0x/gpFU1NIK/W6mzaPulx2nJqxi4m5Rg1uEFwVZk8Nv27CwehSWSipyqP09uj0j7VAk9hOQmkBBXzpcopvPKsD19un416mDPglum0vELiQYxzLpve9I2x4Kem/1SNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=sCP10NAl; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="sCP10NAl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=Vi9/2T/HEIiA1kXPJ5Aifd2KfnGzYJRS9bTtPPU2i1Q=; b=sCP10NAlfiOO7/35vImC/QBmzF
	MNVSsNiTEX04DPRVbWRhbVmbVa+p0W/w2WkblpWW/PXu2+8FFL9D+YY1l4lAG+VdDYm7v/nqMR4+c
	7ucUkJxmddCIxi3hg10byruRBeyNMd10nqTVmZblbSQUrx/uI23IjgHhiUvN6T5ROl9ez1z2iaxO1
	8+ru2oGyXm0m19cV2oXWzByTi1LOfFu2gg4q9x0dlW34WSVNac92aqEQRzdZO4RZ+T8di0S/5LJqQ
	tlx+cd3805wbjsIK4GJZzrBotMDtbPR1vN+THFM//kPHBtRJvoF8zNuaPgCVjQk7+FThnfyI9Zn4L
	ZbfDm3QQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0mW7-0000000ANuY-2oP0;
	Sun, 30 Aug 2026 22:52:39 +0200
Date: Sun, 30 Aug 2026 22:52:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Subject: Random corruption on SpacemiT K1 with RVV and THP
Message-ID: <apSYF5x1Tu7PlyL1@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/2.4.1 (2026-07-04)

Dear all,

For the last weeks, I have been tracking a random memory corruption and
relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It=20
started upgrading to glibc 2.43, which does memset() through vector=20
instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1=20
kernel, but I have also been able to reproduce it with a vanilla 7.2.2=20
kernel, using a similar configuration to the Debian kernel. The board=20
uses OpenSBI 1.9 and the vendor U-Boot.

Typically it manifests itself with the following kind of error, when=20
running g++ from GCC 16 as part of building software (e.g. OpenJDK,=20
Blender, Dolfin, Qt6):  =20

Assembler messages:
{standard input}:284588: Error: unknown pseudo-op: `.uleb1'
{standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'

The broken chars are 0xff and it seems there are always 240 (but with=20
poor statistics). Sometimes it instead causes a GCC ICE instead.

Using glibc 2.44 instead of glibc 2.43, which does a lot of string=20
operations through vector instructions, increases the probability to=20
have corruption, makes it a bit more reproducible, but it always seems=20
to manifest as a GCC ICE. It typically happens withing one hour when=20
running on the 8 cores instead of every 1 or 2 days. From there I have=20
been able to determine the following things:

- Disabling vector instructions (by patching the DTB to remove "v",=20
  "zvhf" and "zvtk") fixes the issue

- Disabling THP (by setting /sys/kernel/mm/transparent_hugepage/enabled=20
  to never instead of always) also seems to fix the issue. Keeping it=20
  enabled with defrag=3Dnever or use_zero_page=3D0 doesn't change anything.

- The issue is reproducible with or without swap enabled.

I have not been able to reproduce the issue on other non RVV boards=20
(Unmatched, VF2) nor on a SpacemiT K3 board.

I am not really sure how to debug that further. I tried a few ways to=20
reproduce the issue with a small C code around the glibc memset code=20
(including triggering unaligned accesses and page faults), but failed to=20
do so. I therefore welcome any idea about the issue or how to debug it=20
further.

Thanks
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
