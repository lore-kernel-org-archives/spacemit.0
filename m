Received: from mail.bix.bg (mail.bix.bg [193.105.196.21])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EFD9B139E
	for <spacemit@lists.linux.dev>; Fri, 31 Jan 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.105.196.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738313137; cv=none; b=T2Y/Qb6Uc1VAGe4rUrPqqn4FM1BpedE7pSf09sA6SJEGPlOg6UKbolxsv6l70DdcU40QH1D4hYZhZRjdT1KpFMrNFkzd1UkHDhYaSz4nDRgRYvzda50vzkWC7k4BnKCcXrTDJkmUPyb4vALNGorIPMR42KJqDnZq4xWnchz1RD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738313137; c=relaxed/simple;
	bh=zjQkcPeXZkHlbui5tM8RZU5pQ5Xn0wg4ORq3i1QjPMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TGaVD761zCDQq441v5XNqMisQi63QxA9C5YJbIocp5dAJQvRSkTXzeVwXixxJS8O7lf6dIlYn3aGq34RJEBUMtMUxS/ccLcdO4ORZFiEOhslNLlPW4NY8RaCicNWxdpZ83ysYCslLaBhi/eQycRy/08glT/l7J7ovy0O22CtimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=declera.com; spf=pass smtp.mailfrom=declera.com; arc=none smtp.client-ip=193.105.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=declera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=declera.com
Received: (qmail 20846 invoked from network); 31 Jan 2025 08:45:32 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 31 Jan 2025 08:45:32 -0000
Message-ID: <43d32fa5b9967b39f0e15bcdca639155489103b8.camel@declera.com>
Subject: Re: Hello and some questions
From: Yanko Kaneti <yaneti@declera.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: spacemit@lists.linux.dev
Date: Fri, 31 Jan 2025 10:45:32 +0200
In-Reply-To: <20250131023835-GYA54139@gentoo>
References: <4b4b0448f3482717910e2b48d43cc4ffe909c1ae.camel@declera.com>
	 <20250131023835-GYA54139@gentoo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.1 (3.55.1-2.1.fc42) 
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-01-31 at 02:38 +0000, Yixun Lan wrote:
> Hi Yanko:
>=20
> On 14:32 Thu 30 Jan     , Yanko Kaneti wrote:
> > Hi,
> >=20
> > I was wandering is anybody from SpacemiT actually involved in this
> > (upstreaming) effort (i.e. at least reading this list)=20
> not sure, but I hope so
> ...
>=20
> ..
> > Does anybody know if https://github.com/spacemit-com/ is officially
> > maintained by them ?
> >=20
> I took over the maintenance for https://github.com/spacemit-com/linux,
> other repos are took care by SpacemiT people
>=20
> > Can anybody address some basic issues like
> > https://github.com/spacemit-com/linux-k1x/issues/7 before even talking
> > about upstreaming..
> >=20
> please wait and be patient as SpacemiT people already respond to the issu=
e,
> besides they are off as it's the chinese new year holiday currently
>=20
> BTW, for upstream, we won't bother firmware/mcu/remote in the near term a=
s
> we currently focus on very basic stuff..
>=20

Thanks for your efforts Yixin.

From my limited experience with the Milk-V Jupiter the MCU was needed to
get the SOC to its maximum clocks. So seems like an integral part of the
package.

Best of luck
Yanko
