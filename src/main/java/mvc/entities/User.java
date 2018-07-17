package mvc.entities;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import mvc.utils.enums.Privilige;
import mvc.utils.enums.WeaponType;
import mvc.validators.ContentSize;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 2, max = 40)
	@NotEmpty
	private String login;

	@Email
	@Column(unique = true, nullable = false)
	@NotEmpty
	private String email;

	@Column(nullable = false)
	@NotEmpty
	private String password;

	private String groupMember;

	@Enumerated(EnumType.STRING)
	@ElementCollection(targetClass = Privilige.class, fetch = FetchType.EAGER) // fetch type eager
	@NotNull
	// @LazyCollection(LazyCollectionOption.FALSE)
	private List<Privilige> priviliges = new ArrayList<Privilige>();

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	// @NotNull
	@ContentSize
	private WeaponType primaryWeapon;

	@Enumerated(EnumType.STRING)
	private WeaponType backupWeapon;

	@Column(columnDefinition = "DATETIME", updatable = false, nullable = false)
	@NotNull
	private Timestamp created;

	@NotNull
	private boolean active;

//	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	// @LazyCollection(LazyCollectionOption.FALSE)
	 private List<Tweet> tweets = new ArrayList<Tweet>();
//	private Set<Tweet> tweets = new LinkedHashSet<Tweet>();

	public User() {
		super();
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", login=" + login + ", email=" + email + ", password=" + password + ", groupMember="
				+ groupMember + ", priviliges=" + priviliges + ", primaryWeapon=" + primaryWeapon + ", backupWeapon="
				+ backupWeapon + ", created=" + created + ", active=" + active + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + ((backupWeapon == null) ? 0 : backupWeapon.hashCode());
		result = prime * result + ((created == null) ? 0 : created.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((groupMember == null) ? 0 : groupMember.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((primaryWeapon == null) ? 0 : primaryWeapon.hashCode());
		result = prime * result + ((priviliges == null) ? 0 : priviliges.hashCode());
		result = prime * result + ((tweets == null) ? 0 : tweets.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (active != other.active)
			return false;
		if (backupWeapon != other.backupWeapon)
			return false;
		if (created == null) {
			if (other.created != null)
				return false;
		} else if (!created.equals(other.created))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (groupMember == null) {
			if (other.groupMember != null)
				return false;
		} else if (!groupMember.equals(other.groupMember))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (primaryWeapon != other.primaryWeapon)
			return false;
		if (priviliges == null) {
			if (other.priviliges != null)
				return false;
		} else if (!priviliges.equals(other.priviliges))
			return false;
		if (tweets == null) {
			if (other.tweets != null)
				return false;
		} else if (!tweets.equals(other.tweets))
			return false;
		return true;
	}

	public void addPrivilege(Privilige priviliges) {
		this.priviliges.add(priviliges);
	}

	public String[] getStringPriviliges() {
		// String[] names = (String[]) this.priviliges.stream().map(element ->
		// element.name()).toArray();
		String[] names = new String[this.priviliges.size()];
		for (int i = 0; i < names.length; i++) {
			names[i] = this.priviliges.get(i).name();
		}
		return names;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(String groupMember) {
		this.groupMember = groupMember;
	}

	public List<Privilige> getPriviliges() {
		return priviliges;
	}

	public void setPriviliges(List<Privilige> priviliges) {
		this.priviliges = priviliges;
	}

	public WeaponType getPrimaryWeapon() {
		return primaryWeapon;
	}

	public void setPrimaryWeapon(WeaponType primaryWeapon) {
		this.primaryWeapon = primaryWeapon;
	}

	public WeaponType getBackupWeapon() {
		return backupWeapon;
	}

	public void setBackupWeapon(WeaponType backupWeapon) {
		this.backupWeapon = backupWeapon;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<Tweet> getTweets() {
		return tweets;
	}

	public void setTweets(List<Tweet> tweets) {
		this.tweets = tweets;
	}

}
