Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E94396567
	for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449454; cv=none; b=TMsjM3k03OBXnD0LIn+PNy5RR1EsLPJFK/6OHSUYYmMXD25/scMrjVaCHnC0W4h2SMD+qM9zQpKYba/k2eQGgJ3nL42X79K8PkXhZNVJRzAvIjMWdJLsErfl8KowgZjfjyx1Kr4rhk34htSby+sL71c7a0YF6A6OXgCSmrsTBF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449454; c=relaxed/simple;
	bh=UPeTgm4C/Ie1ap4dTBAYXimQGkzcmNYfJQ4v7B4RFro=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gR9wkAlsefj1qrka+XuRJGLDZMPQ4OzwHrMSb38dvqIspNeETnADu+sHsV/GcmJrSqqF4N9jNRyFQmRvo/ON9vwmEB6+svbVZ2nDoJRioh+obywu41fAijWjgkfRt3OR9D52Ctiph8Bdg2Pxr11xZ4Kz1ld1eJsnJpS27Z+gHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DlfHhjgI; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DlfHhjgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449417;
	bh=BJ49DOwjJR+WskeXhiKnY23XN8YKPK13S13MmrbKwMI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=DlfHhjgIlHENkjf5MIfspnSmMsP+C0g9jIGEq8vq0kPNG55bSBLlbOVVwqeXJ3X57
	 bplq4cKIl3cbkuH1/g+ns4KDv5AaL+/F9+aI/vPzjc4ssbQ03A3s5ns56rGnXlmI6k
	 7NLXsHMluwHg8QjAUfwR77uiYT+nORHXMINPPHSY=
X-QQ-mid: esmtpgz16t1777449409tac12cdb6
X-QQ-Originating-IP: DkWHvUEwJTe71CZ7AGA68Q4lc/p1h5yY4D/tlreyZvA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:56:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 729058513551534686
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:56:47 +0800
Message-Id: <DI5H899DW2NZ.P89S1L5KSOO9@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX
 is running
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
 <afFsyiSHrVBapQ9V@sirena.co.uk>
In-Reply-To: <afFsyiSHrVBapQ9V@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MaP/HMsInhq9J49gMW7EIxQ//3dDlCTN83yVplryoP3AVIG5jtxkkuPd
	ysMPgzFUCuktIYRg2Zv2IXL+GTMWwfYV1V/0CgL8Ovc4TraRFlVBPJn7Vpmew0gW/vXR5si
	YqTuex3Q4+K5bhjqBFcYCEXrKyBebMjWQzsa0goquWpMNJWPuJUFtCcBYJWM4IzXItg5sdw
	YnuDPGMxgMjjp3S8P0bAXYA/DN7Ye11Ut15i2pJLXpvD90AonN0TimrqLYqck+25DrJL0bP
	h3BGH1tKqmsZH7x07eg2tK30pBtRC1I1g6ZTYp4GfXaw/LHnF+78Roffc4GfZPKBBIEm9R6
	pwP5CeXiTPnTTxru+Yru2Ku2LmOc6S5knI0BBWxwP7ZVSmpc/P0ff1e4A/sEw9r7OqU/frk
	aemMUfIR0Q0Mak0qmo/Vbposm7g3GqkW4BVNgo02Pib+03K6KplTlYplg+i4ziyGdafR+Pm
	ji/+Cthu8/49M/kY52nHX02tocHk0Oe19HDde4IKnpCMZ9RjD0wfVi6eJdVbS1bzD9Pv6z1
	Vc6M1GGB+zncuuMCSCq986eT5J6aveHW+Z7dVDt5YsBIDV/JJWzc20Hvf3yDxAwvzR5OTR5
	dwFjZ+lHZs7ewyn/9RBEpY9WaD+yUmaABngdMirQWiwd1SS7xCAKLWL/TMP+p7s4KghEl79
	dIRWT1nQ7VgwWUwSjbfs0L+uLzpHeC4ZU0k9TXRlffznjsk/lMAZ/VKHrZZXS/+QkpC8gp4
	S2ASeXGGFJ4gnBYOQKupieWFwbhWcRwvAwLryrEIIpwjPZoPrfbOIYXpgAFcKvHWXlfyZu8
	AcEQCANK/tw/cfqmFlGpE4la3XFPwoXOnoDwZApM4VRTYOpIgo2nqxK+3FHukc/2zr8QHef
	4WhvbWDHUpF1M5t4lKwedq2nVUg39y7f7lpjXbH37V9ct36SDC4OssCd7AYv9mRFHEXqsMT
	TGsIf1LbQHvPpM6d0uSYmN2+Ghc0PFGQv+yCDQO1VXjibVU912aNYahFfviQ0JMdmsLoPqQ
	//U/t0YBkVneUItYjYEQRATM4xpgy4aIJ4uNjfbQo3zaXGu4kABpVBWRhHUTPDkKu4OG/gu
	oV++260x+aTS4JAd0J6Qqp+uTTl6iJxuw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:28 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> +	val =3D readl(i2s->base + SSCR);
>> +	if (val & SSCR_SSE)
>> +		return 0;
>> +
>>  	val =3D readl(i2s->base + SSCR);
>>  	val &=3D ~SSCR_DW_32BYTE;
>>  	val |=3D data_width;
>
> Very minor optimisation but those two SSCR reads could be combined.
Thanks. I'll fix it.

                   - Troy

